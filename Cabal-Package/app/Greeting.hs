module Greeting where

import Data.Monoid (mconcat)
import Data.Text.Lazy (Text, pack)


data Language = English | Espanol
    deriving (Read)


greeting :: Language -> Text
greeting English = pack "Hello"
greeting Espanol = pack "Hola"

greet :: Text -> Language -> Text
greet name language = 
    mconcat [ greeting language, pack " ", name]