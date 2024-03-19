
getStory :: String -> String
getStory name = "First, " ++ name ++ " woke up. Second" ++ name ++ "wrote some Hasell"

main = putStrLn (getStory "Habiba")

