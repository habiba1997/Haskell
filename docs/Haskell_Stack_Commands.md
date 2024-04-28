# Creating a stack project
We'll start off with the stack new command to create a `new` project, that will contain a Haskell package of the same name.

- `stack new helloworld new-template`
- `stack build`
- `stack exec helloworld-exe`

### To choose a specific resolver while creating a project 
`stack --resolver nightly-2024-03-27 new firstproject`

- In setup --resolver command you used a stack version nighty ...., if you want to change it later after creating the project then go to stack.yaml file and change the resolver
- add your packages in package.yaml -> dependencies list 

The `stack test` command
Finally, like all good software, helloworld actually has a test suite.

The `stack clean` command deletes the local working directories containing compiler output. By default, that means the contents of directories in .stack-work/dist, for all the .stack-work directories within a project.

Use `stack clean <specific-package`> to delete the output for the package specific-package only.

The `stack purge` command deletes the local stack working directories, including extra-deps, git dependencies and the compiler output (including logs).

### Folder structure
- app folder contain main forlder of our program
- lib a module that conatin a liberay module

### Commands
- download haskel version
`stack setup`

- Build project and create a binary file
`stack build`

- see the list on installed packages 
`stack exec ghc-pkg --list`


- Install ghc
` ghcup install 9.4.7 `
`ghcup install cabal 3.10.3.0`
`ghcup install stack {2.11.1}`

- list available ghc/cabal versions
`ghcup list`

- install the recommended GHC version
`ghcup install ghc`

- install a specific GHC version
`ghcup install ghc 8.2.2`

- set the currently "active" GHC version
`ghcup set ghc 8.4.4`

- install cabal-install
`ghcup install cabal`

- update ghcup itself
`ghcup upgrade`

# Simple-Server Project

1- Create folder and folder structure 
`stack --resolver nightly-2024-03-27 new simpleserver`

2- Write Code in /app/Main.hs and Update package.yaml executables

3- Setup
`stack ghc setup`

4- Setup
`stack build`

5- Run 
`stack run`



## Info 
(cabal vs stack)[https://gist.github.com/merijn/8152d561fb8b011f9313c48d876ceb07]

## Stack guide 
https://github.com/commercialhaskell/stack/blob/master/doc/GUIDE.md#external-dependencies


## Haskell ToolChain
### Hlint:

Hlint is available as a standalone command-line tool
`stack install hlint`
Once installed, you can run Hlint from the command line within your project directory to lint your Haskell code. 
allowing you to see linting suggestions directly within your editor.
C:\Users\habiba.ahmed\AppData\Roaming\local\bin\hlint.exe.


### Hoogle:

Hoogle is primarily a web-based tool
https://hoogle.haskell.org/.
 You can install Hoogle using Haskell's package manager, Cabal:
`stack install hoogle`
After installation, you can run hoogle commands from the terminal to search for Haskell functions, types, and modules.
C:\Users\habiba.ahmed\AppData\Roaming\local\bin\hoogle.exe.


### Ormolu:

`stack install ormolu`
to format your Haskell code according to a predefined style.
C:\Users\habiba.ahmed\AppData\Roaming\local\bin\ormolu.exe.