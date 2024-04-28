{-# LANGUAGE NoMonomorphismRestriction #-}

import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine

sierpenski :: Int -> Diagram B R2
sierpenski n
  | n == 0 = mempty
  | otherwise = 
      piece red === (centerX (piece green ||| piece blue))
      where
        piece color = triangle 1 # lc color # alignT 
                      <> sierpenski (n-1) # scale 0.5 # alignT

drawing :: Diagram B R2
drawing = sierpenski 7 # lw 0.01 # center # pad 1.2 # bg black

main :: IO ()
main = mainWith drawing