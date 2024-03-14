Install Visual studio code
Add plugin Haskell Syntax Highlighting


https://www.haskell.org/downloads/
For windows
-install chocoloagy 
-https://chocolatey.org/install

-windows powershell [run as adminstrator]:
$ Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

$ choco install haskell-dev
$ refreshenv


write code in files with exension 
{filname}.hs
and compile them using WinGHCi tool installed with haskall

install ghcup: https://www.haskell.org/ghcup/install/

Set-ExecutionPolicy Bypass -Scope Process -Force;[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; try { Invoke-Command -ScriptBlock ([ScriptBlock]::Create((Invoke-WebRequest https://www.haskell.org/ghcup/sh/bootstrap-haskell.ps1 -UseBasicParsing))) -ArgumentList $true } catch { Write-Error $_ }

install exe https://docs.haskellstack.org/en/stable/
https://docs.haskellstack.org/en/stable/
download exe
validate stack is added onto the path variables 


`ghc .\main.hs`
`.\main.exe`

``` 
cabal update
Downloading the latest package list from hackage.haskell.org
```

could see a warning to install cabal install program
```cabal install cabal-install```

You can traverse through all haskel/cabal packages in [www.hackage.haskell.org/packages](https://hackage.haskell.org/packages/browse)
```cabal install {package name}```

To create a cabale package
1- go to source directory for your package
2- ` cabal init` 

PS C:\Users\habiba.ahmed\Desktop\haskell\Cabal-Package> cabal init
What does the package build:
   1) Library
 * 2) Executable
   3) Library and Executable
   4) Test suite

Do you wish to overwrite existing files (backups will be created) (y/n)? [default: n] y

Please choose version of the Cabal specification to use:
   1) 1.24  (legacy)
   2) 2.0   (+ support for Backpack, internal sub-libs, '^>=' operator)
   3) 2.2   (+ support for 'common', 'elif', redundant commas, SPDX)
   4) 2.4   (+ support for '**' globbing)
 * 5) 3.0   (+ set notation for ==, common stanzas in ifs, more redundant commas, better pkgconfig-depends)
   6) 3.4   (+ sublibraries in 'mixins', optional 'default-language')


Please choose a license:
   1) BSD-2-Clause
   2) BSD-3-Clause
   3) Apache-2.0
   4) MIT
   5) MPL-2.0
 * 6) ISC
   7) GPL-2.0-only
   8) GPL-3.0-only
   9) LGPL-2.1-only
  10) LGPL-3.0-only
  11) AGPL-3.0-only
  12) GPL-2.0-or-later
  13) GPL-3.0-or-later
  14) LGPL-2.1-or-later
  15) LGPL-3.0-or-later
  16) AGPL-3.0-or-later
  17) Other (specify)



Project category:
   1) Codec
   2) Concurrency
   3) Control
   4) Data
   5) Database
   6) Development
   7) Distribution
   8) Game
   9) Graphics
  10) Language
  11) Math
  12) Network
  13) Sound
  14) System
  15) Testing
  16) Text
* 17) Web
  18) Other (specify)

What is the main module of the executable:
 * 1) Main.hs
   2) Main.lhs
   3) Other (specify)

Application directory:
 * 1) app
   2) exe
   3) src-exe
   4) Other (specify)

Choose a language for your executable:
 * 1) Haskell2010
   2) Haskell98
   3) GHC2021 (requires at least GHC 9.2)
   4) Other (specify)

Add informative comments to each field in the cabal file. (y/n)? [default: y]

