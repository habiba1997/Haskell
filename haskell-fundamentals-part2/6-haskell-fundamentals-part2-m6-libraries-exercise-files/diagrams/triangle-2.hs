
{-# LANGUAGE NoMonomorphismRestriction #-}

import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine

example :: Diagram B R2
example = triangle 1 # fc black # lc blue # lw 0.05

main = mainWith (example # pad 1.2)