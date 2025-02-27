filterAndFold :: (a -> Bool) -> (b -> a -> b) -> b -> [a] -> b
filterAndFold p f z = foldl f z . filter p

sumOddNumbers :: [Int] -> Int
sumOddNumbers a = filterAndFold odd (+) 0 a

main :: IO ()
main = print (sumOddNumbers [1, 2, 3, 4, 5, 6])

