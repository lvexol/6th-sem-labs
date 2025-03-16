removeOdd :: [Int] -> [Int]
removeOdd = filter even

main :: IO ()
main = print (removeOdd [1, 2, 3, 4, 5, 6, 7, 8])

