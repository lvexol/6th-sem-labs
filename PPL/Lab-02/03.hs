doubleAndIncrement :: [Int] -> [Int]
doubleAndIncrement = map ((+1) . (*2))

main :: IO ()
main = print (doubleAndIncrement [1, 2, 3, 4, 5])

