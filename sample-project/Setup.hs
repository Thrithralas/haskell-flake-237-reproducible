import Distribution.Simple
import Distribution.Simple.Program
import Distribution.Verbosity

main :: IO ()
main = do
  (p, d) <- requireProgram verbose (simpleProgram "hello") defaultProgramDb
  defaultMain
