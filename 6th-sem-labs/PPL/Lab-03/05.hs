filterEven :: [Int] -> [Int]
filterEven xs = [x | x <- xs, x `mod` 2 == 0]

main :: IO ()
main = print (filterEven [1, 2, 3, 4, 5, 6, 7, 8])

