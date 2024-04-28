
{-# LANGUAGE NoMonomorphismRestriction #-}

import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine

example :: Diagram B R2
example = triangle 1 # fc red === circle 1 # fc blue

main = mainWith (example # pad 1.1)