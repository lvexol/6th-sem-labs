sumOfSquare :: [Int] -> Int
sumOfSquare = mySum . map (^2)

mySum :: [Int] -> Int
mySum [] = 0
mySum (x:xs) = x + mySum xs

main :: IO ()
main = print (sumOfSquare [10, 20, 30])

