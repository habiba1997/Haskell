-- The reverseLines function is just a plain old pure function with no IO actions, but it is still able to very elegantly express this program that reads lines from the console as needed 
-- and writes output to the console as soon as it can, and all it needs is lazy function evaluation
reverseLines input = unlines (map reverse (lines input))

main = interact reverseLines