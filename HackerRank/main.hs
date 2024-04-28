-- the input "1 2 3".
-- -- interact $ show . sum . map read . words 
import Data.List
import Data.Function 

-- words function:
-- words function takes a string and splits it into a list of words (separated by whitespace).
-- Example: words "1 2 3" will produce ["1", "2", "3"].

-- map read:
-- map read applies the read function to each element of a list, converting each string in the list to its corresponding value of a different type.
-- Example: map read ["1", "2", "3"] will produce [1, 2, 3].

-- sum function:
-- sum function takes a list of numbers and returns their sum.
-- Example: sum [1, 2, 3] will produce 6.

-- show function:
-- show function converts a value to its string representation.
-- Example: show 6 will produce "6".
-- interact function:

-- interact function takes a function of type String -> String and applies it to the entire input string, producing the output string.

-- Input: "1 2 3"
-- words: ["1", "2", "3"]
-- map read: [1, 2, 3]
-- sum: 6
-- show: "6"

-- show . sum . map read . word  :: String -> String (function)
-- to apply it all as a BULK on "1 2 3" 
-- use $ 
-- Without the $ operator, the function composition (.) would be applied first,
--  and then the result of words "1 2 3" would be passed as an argument to the composed function. 
-- show . sum . map read . words  "1 2 3" => error (l2n kda words al bt5)
-- show . sum . map read => function f
-- f . ["1", "2", "3"]
-- but ["1", "2", "3"] is a Monad List
-- while f is function
-- => error 

-- Correct:
-- USE $ 
--  show . sum . map read . words $ "1 2 3"
-- f $ ["1", "2", "3"]

-- HackerRank worm up Sum
io_fun = show . sum . map read . words 

-- 1- HackerRank {Grading students}
roundUp :: Int -> Int
roundUp value 
    | value >= 38 && diff < 3 = nextM5
    | otherwise = value
    where 
        modd = value `mod` 5
        nextM5 = value + (5 - modd)
        diff = nextM5 - value
   
roundUpList :: [Int] -> [Int]
roundUpList xs = map roundUp xs
gradingStudents = unlines . map show . roundUpList . map read . tail . words
-- -- interact $ unlines . map show . roundUpList . map read . tail . words


-- 2- {Apple and Oranges}

isItInsideMargin :: Int -> Int -> Int -> Bool
isItInsideMargin margin1 margin2 value =  value >= margin1 && value <= margin2

countApplesAndOranges :: Int -> Int -> Int -> Int -> [Int] -> [Int] -> IO () 
countApplesAndOranges s t a b apples oranges = do
    putStrLn (show  $ length (filter (isItInsideMargin s t) app_loc))
    putStrLn (show $ length (filter (isItInsideMargin s t) orange_loc))
    where 
        app_loc = map (\x -> x + a) apples
        orange_loc = map (\x -> x + b) oranges

-- OR
-- [7 11 5 15 3 2 -2 2 1 5 -6]
-- [7,11,5,15,3,2,-2,2,1,5,-6]
countApplesAndOrangesSolve :: [Int] -> [Int]
countApplesAndOrangesSolve (s:t:a:b:m:_:rest) = [app, org]
    where 
    apples = take m rest
    oranges = drop m rest
    app = length (filter (isItInsideMargin s t) (map (\x -> x + a) apples))
    org = length (filter (isItInsideMargin s t) (map (\x -> x + b) oranges))

-- main = putStrLn countApplesAndOrangesSolve [7,11,5,15,3,2,-2,2,1,5,-6]
countApplesAndOrangesSolveInteract = unlines . map show .  countApplesAndOrangesSolve . map read . words
-- interact $ unlines . map show .  countApplesAndOrangesSolve . map read . words


-- 2- {Divisible Sum Pairs}

-- [i | i <- [1 .. 10]] 
-- [1,2,3,4,5,6,7,8,9,10]
-- -- zip can combine values into tuple pairs 
-- names = ["Bob","Mary","Tom"]
-- addresses = ["123 Main","234 North","567 South"]
 
-- namesNAddress = zip names addresses 
divisibleSumPairs :: [Int] -> Int
divisibleSumPairs (_:k:xs) =
    length [ 42 | (index_i, i) <- zip [0 ..] xs,
              (index_j, j) <- zip [0..] xs,
                 index_i< index_j, -- we can add here conditions 
                 (i + j) `mod` k == 0 -- devisible by k
                ]

-- main = interact $ show . divisibleSumPairs . map read . words
                -- [6,3,1,3,2,6,1,2]
-- interact $ show . divisibleSumPairs . map read . words
divisibleSumPairsInteract = show . divisibleSumPairs . map read . words
--  divisibleSumPairsInteract "6 3 1 3 2 6 1 2" 

-- -3- Migratory Birds

-- sort [1,1,2,3,3]
-- group $ sort [1,1,2,3,3]

solveMB :: [Int] -> Int
solveMB = head . head . sortBy (flip compare `on` length) . group . sort
-- main = interact $ show . solveMB . map read .tail . words


