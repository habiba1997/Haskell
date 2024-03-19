--  . This helps Haskell's type inference deal with some of the more complicated types used by Diagrams.
{-# LANGUAGE NoMonomorphismRestriction #-}

-- which provides all the basic functions for defining a diagram, and the SVG backend for Diagrams to create the output
import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine

-- We use the mainWith function from the SVG backend, 
-- which provides a default implementation of main that handles some of the command line arguments and draws the given diagram to an SVG file

-- a triangle with side length 1 constructed by the triangle function
--  then we need to explici type of diagram we want to draw
-- The R2 type specifies that the Diagram is two-dimensional
-- The B type specifies the backend, which will generate an SVG
-- main = mainWith (triangle 1 :: Diagram B R2)
main :: IO ()
main = do
  -- Draw and save diagram 1
  renderSVG "diagram1.svg" (mkWidth 400) $ example1
  -- Draw and save diagram 2
  renderSVG "diagram2.svg" (mkWidth 400) $ example2
  -- Draw and save diagram 3
  renderSVG "diagram3.svg" (mkWidth 400) $ example3
  -- Draw and save diagram 4
  renderSVG "diagram4.svg" (mkWidth 400) $ example4
 -- Draw and save diagram 5
  renderSVG "diagram5.svg" (mkWidth 400) $ example5

--  The # operator is used in the Diagram's library to provide an intuitive way to modify properties of a Diagram.
--  First we use the fc function to change the foreground color to black, or more precisely,
-- Then we change the line color to blue with the lc function.
--  And finally, we change the line width to 0. 1 with the lw function.
example1 :: Diagram B R2
example1 = triangle 1 # fc black # lc blue # lw 0. 1

--  we build a red triangle and a circle of radius 1 that's blue and overlay them with the diamond operator.
--  This draws the first diagram, the red triangle, on top of the second diagram, the blue circle
example2 :: Diagram B R2
example2 = triangle 1 # fc red <> circle 1 # fc blue

--  you can put one above the other. 
-- The triple equals operator will line up the bottom of the first diagram, the red triangle, with the top of the second diagram, the blue circle.
example3 :: Diagram B R2
example3 = triangle 1 # fc red === circle 1 # fc blue

-- you can also line up two diagrams horizontally using the triple pipe operator
example4 = triangle 1 # fc red ||| circle 1 # fc blue


-- This diagram starts with a red triangle and scales it by 2 in the Y direction. 
-- This is then rotated counter-clockwise by 1/9th of a full rotation. 
-- And finally translated by 1 in the X direction.
example5 :: Diagram B R2
example5 = triangle 1 # fc red # scaleY 2 # rotateBy (1/9) # translateX 1
          <> circle 1 # fc blue