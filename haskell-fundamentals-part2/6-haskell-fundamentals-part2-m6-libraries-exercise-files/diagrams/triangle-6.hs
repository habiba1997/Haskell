
{-# LANGUAGE NoMonomorphismRestriction #-}

import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine

example :: Diagram B R2
example = triangle 1 # fc red # scaleY 2 # rotateBy (1/9) # translateX 1
          <> circle 1 # fc blue

main = mainWith (example # pad 1.1)