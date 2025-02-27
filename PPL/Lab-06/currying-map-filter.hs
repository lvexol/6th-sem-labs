filterAndMap :: (a -> Bool) -> (a -> b) -> [a] -> [b]
filterAndMap p f = map f . filter p

doubleEvenNumbers :: [Int] -> [Int]
doubleEvenNumbers = filterAndMap even (*2)

main :: IO ()
main = print (doubleEvenNumbers [1, 2, 3, 4, 5, 6])

