The hello-scotty directory contains the web application cabal package that was constructed in this module.

You need to have the Haskell Platform (http://www.haskell.org/platform/) installed to run the code.

once the Haskell Platform is installed, open a command line in the hello-scotty directory, and type

  cabal install --only-dependencies
  cabal configure
  cabal build

to build the package, and

  cabal run

to run the executable after it has been built. You should then be able to point a browser at, for example,

  http://localhost:3000/English/Benson

to see it in action.