composeFilterMap :: (a -> Bool) -> (a -> b) -> [a] -> [b]
composeFilterMap p f = map f . filter p

squareNumbersLessThan5 :: [Int] -> [Int]
squareNumbersLessThan5 = composeFilterMap (<= 5) (^2)

main :: IO ()
main = print (squareNumbersLessThan5 [3, 7, 2, 8, 4, 6])

