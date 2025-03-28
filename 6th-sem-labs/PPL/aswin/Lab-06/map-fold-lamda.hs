sumStringLengths :: [String] -> Int
sumStringLengths = foldl (+) 0 . map length

main :: IO ()
main = print (sumStringLengths ["hello", "world", "haskell"])

