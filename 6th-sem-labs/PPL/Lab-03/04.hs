sumList :: [Int] -> Int
sumList [] = 0
sumList (x:xs) = x + sumList xs

main :: IO ()
main = print (sumList [1, 2, 3, 4, 5])

