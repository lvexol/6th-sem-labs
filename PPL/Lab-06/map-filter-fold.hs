productDoublesLessThan10 :: [Int] -> Int
productDoublesLessThan10 = foldl (*) 1 . map (82) . filter (<= 10)

main :: IO ()
main = print (productDoublesLessThan10 [5, 12, 9, 20, 15])

