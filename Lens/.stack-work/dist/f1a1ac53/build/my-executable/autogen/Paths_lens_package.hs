{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_lens_package (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude


#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath



bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "C:\\Users\\habiba.ahmed\\Desktop\\haskell\\.stack-work\\install\\6b249666\\bin"
libdir     = "C:\\Users\\habiba.ahmed\\Desktop\\haskell\\.stack-work\\install\\6b249666\\lib\\x86_64-windows-ghc-9.4.8\\lens-package-0.1.0.0-LTfjAgozYDmEZu267uX1MB-my-executable"
dynlibdir  = "C:\\Users\\habiba.ahmed\\Desktop\\haskell\\.stack-work\\install\\6b249666\\lib\\x86_64-windows-ghc-9.4.8"
datadir    = "C:\\Users\\habiba.ahmed\\Desktop\\haskell\\.stack-work\\install\\6b249666\\share\\x86_64-windows-ghc-9.4.8\\lens-package-0.1.0.0"
libexecdir = "C:\\Users\\habiba.ahmed\\Desktop\\haskell\\.stack-work\\install\\6b249666\\libexec\\x86_64-windows-ghc-9.4.8\\lens-package-0.1.0.0"
sysconfdir = "C:\\Users\\habiba.ahmed\\Desktop\\haskell\\.stack-work\\install\\6b249666\\etc"

getBinDir     = catchIO (getEnv "lens_package_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "lens_package_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "lens_package_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "lens_package_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "lens_package_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "lens_package_sysconfdir") (\_ -> return sysconfdir)




joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '\\'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/' || c == '\\'
