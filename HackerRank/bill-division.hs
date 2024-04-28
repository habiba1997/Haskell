import Control.Monad

execludeNth:: Int -> [a] -> [a]
execludeNth n xs = left ++ tail right
    where (left, right) = splitAt n xs

solveBD:: Int       -- k
       -> [Int]     --bill
       -> Int       --b
       -> Maybe Int
solveBD k bill b 
    | b > actualPrice = Just (b - actualPrice)
    | otherwise = Nothing
    where actualPrice = (sum $ execludeNth k bill ) `div` 2
    
getList :: Read a => IO [a]
getList = do
    line <- getLine
    return $ map read $ words line

main:: IO()
main = do
    [[_,k], bill, [b]] <- replicateM 3 getList
    putStrLn $ maybe "Bon Appetit" show $ solveBD k bill b 
    
-- -4- Bill Division
-- [4 1 3 10 2 9 12]
--  _ k 