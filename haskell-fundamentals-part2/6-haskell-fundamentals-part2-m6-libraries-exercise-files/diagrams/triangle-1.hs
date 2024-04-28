
{-# LANGUAGE NoMonomorphismRestriction #-}

import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine

main = mainWith (triangle 1 # pad 1.1 :: Diagram B R2)