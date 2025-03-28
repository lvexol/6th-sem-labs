addThenMultiply :: Int -> Int -> Int -> Int
addThenMultiply = (\x y z -> (x + y) * z)

main :: IO ()
main = print (addThenMultiply 2 3 4)

