applyOp :: (Int -> Int -> Int) -> [Int] -> Int
applyOp op xs = foldl op 0 xs


sumOfSquaresOfEvens :: [Int] -> Int
sumOfSquaresOfEvens xs = applyOp (+) (map (^2) (filter even xs))

main = do
    print (sumOfSquaresOfEvens [1, 2, 3, 4, 5, 6])
    print (sumOfSquaresOfEvens [1, 3, 5])
    print (sumOfSquaresOfEvens [2, 4, 6, 8, 10])
    print (sumOfSquaresOfEvens [1, 2, 3, 4])

