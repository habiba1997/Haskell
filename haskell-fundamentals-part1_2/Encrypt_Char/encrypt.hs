encrypt :: Char -> Char
encrypt c
   | 'A' <= c && c <= 'Z' = toEnum ( fromEnum c +1)
   | 'a' <= c && c <= 'z' = toEnum ( fromEnum c +1)
   | c == 'Z' = 'A'
   | otherwise = c


main = interact (map encrypt)