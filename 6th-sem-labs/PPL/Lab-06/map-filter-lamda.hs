sumOfSquares :: [Int] -> Int
sumOfSquares xs = sum (map (^2) (filter (<= 10) xs))

main = do
    print (sumOfSquares [5, 12, 9, 20, 15])
    print (sumOfSquares [2, 3, 7, 8])
    print (sumOfSquares [15, 18, 12, 20])
    print (sumOfSquares [1, 2, 3])

