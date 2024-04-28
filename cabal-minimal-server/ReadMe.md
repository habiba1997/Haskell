
### 1- Initialize cabal in folder 
`cabal init`

### 2- Create your folder structure
`cabal init --non-interactive --no-comments --exe --dependency "base, servant-server, wrap"`

### 3- Write code in /app/Main.hs
```haskell
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}
module Main where

import Servant
import Data.Function ((&))
import Network.Wai.Handler.Warp (run)

type API = "counter" :> PostNoContent

makeServer :: Server API
makeServer = pure NoContent

main :: IO ()
main = do
    putStrLn "Hello, Haskell!"
    let application :: Application = makeServer & serve (Proxy @API)
    application & run 8000
    pure ()
```
### 4- Run server 
`curl -i -X POST localhost:8000/counter`

