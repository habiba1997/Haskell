{-# LANGUAGE NoMonomorphismRestriction #-}

import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine
import Data.Colour.RGBSpace
import Data.Colour.RGBSpace.HSV
import Data.Colour.SRGB

getColor :: Double -> Colour Double
getColor t = uncurryRGB (rgbUsingSpace sRGBSpace) $ hsv (t*300) 1 1

dragon :: Double -> Double -> Int -> Diagram B R2
dragon t0 t1 n
  | n == 0    = alignL (hrule 1 # lc (getColor t) # lineCap LineCapRound)
  | otherwise = 
      firstHalf <> secondHalf
      where
        t = (t0+t1)/2
        firstHalf = dragon t0 t (n-1)
        secondHalf = dragon t1 t (n-1) # rotateBy (1/4) # translate offset
        offset = (r2 (1,0)) # rotateBy (-(fromIntegral n)/8) # scale ((sqrt 2) ^ n)

drawing :: Diagram B R2
drawing = bg black . pad 1.2 . center . lw 0.05 . scaleUToX 10 $ dragon 0 1 15

main :: IO ()
main = mainWith drawing