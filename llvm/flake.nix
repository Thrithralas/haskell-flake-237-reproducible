{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    haskell-flake.url = "github:srid/haskell-flake";
    llvm-hs = {
      url = "github:llvm-hs/llvm-hs/llvm-15";
      flake = false;
    };
  };
  outputs = inputs@{ self, nixpkgs, flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = nixpkgs.lib.systems.flakeExposed;
      imports = [ inputs.haskell-flake.flakeModule ];

      perSystem = input@{ self', pkgs, ... }: {

        # Typically, you just want a single project named "default". But
        # multiple projects are also possible, each using different GHC version.
        haskellProjects.default = {
          #settings.llvm-hs.source = inputs.llvm-hs + "/llvm-hs"; 
          # ^ uncomment this and and change 9 to 15 below
          settings.llvm-hs = {
            broken = false;
            jailbreak = true;
            custom = pkgs.haskell.lib.compose.overrideCabal (drv: {
              libraryToolDepends = (drv.libraryToolDepends or []) ++ [ pkgs.llvmPackages_9.llvm.dev ];
            });
          };
        };

        # haskell-flake doesn't set the default package, but you can do it here.
        packages.default = self'.packages.example;
      };
    };
}
