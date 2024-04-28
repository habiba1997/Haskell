import Control.Monad
import Data.List
import Data.Maybe

getInput :: Read a => IO [a]
getInput = do
    line <- getLine
    return $ map read $ words line

main:: IO()
main = do
    [[budget,_, _], keyboards, drives] <- replicateM 3 getInput
    putStrLn $ show $ solveES budget keyboards drives
    
solveES:: (Num a, Ord a) => a -> [a] -> [a] -> a
solveES budget keyboards drives = 
    fromMaybe (-1) $ 
    listToMaybe $ 
    sortBy (flip compare) $
    filter (<=budget) $
    liftM2 (+) keyboards drives 