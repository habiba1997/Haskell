import Data.List


solveSBM :: [Int] -> Int
solveSBM list = sum $ map (\x -> (length x) `div` 2) $ group $ sort $ list



main = interact $ show . solveSBM . tail . map read . words 

-- 9                          
-- 10 20 20 10 10 30 50 10 20