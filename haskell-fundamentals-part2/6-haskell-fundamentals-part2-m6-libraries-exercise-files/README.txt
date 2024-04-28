You need to have the Haskell Platform (http://www.haskell.org/platform/) installed to run the code.

The lens subdirectory has a source file that is intended to be loaded in GHCi by either double clicking on the code.hs file, or typing "ghci LensExamples.hs" on a command line.

The diagrams and frp directories contain source files that are intended to be compiled to executables using, e.g. "ghc triangle-1.hs". There is also a cabal packages that can be used to compile all of the executables with "cabal build".