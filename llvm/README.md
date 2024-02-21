With version 9 the logs clearly show that `llvm-config` has been found.

```
       > /nix/store/4cjqvbp1jbkps185wl8qnbjpf8bdy8j9-gcc-wrapper-13.2.0/bin/strip
       > Using tar found on system at:
       > /nix/store/1ds6c0i7z4advdr0z210sxgvmq786h09-gnutar-1.35/bin/tar
       > No uhc found
       > Running phase: buildPhase
       > /nix/store/crrbr9l4clb3gr3967h1gmax95swxy7i-llvm-9.0.1-dev/bin/llvm-config --version
       > /nix/store/crrbr9l4clb3gr3967h1gmax95swxy7i-llvm-9.0.1-dev/bin/llvm-config --libdir
       > Preprocessing library for llvm-hs-9.0.1..
       > Setup.hs:(172,15)-(181,15): Missing field in record construction ppOrdering
       >
```
But with version 15 + source, the llvm-config isn't found

```
       > Using Parsec parser
       > CallStack (from HasCallStack):
       >   withMetadata, called at libraries/Cabal/Cabal/src/Distribution/Simple/Utils.hs:370:14 in Cabal-3.8.1.0:Distribution.Simple.Utils
       > Error: Setup: The program 'llvm-config' version >=15.0 && <15.1 is required
       > but it could not be found.
       >
       For full logs, run 'nix log /nix/store/fvw0fsqpv5ikg6d6frjgphhwsgs6pxaw-llvm-hs-source-15.0.0.drv'.
```
