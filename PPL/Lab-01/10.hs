transformList :: [Int] -> [Int]
transformList = map ((+ 10) . (^ 2))

main :: IO ()
main = print (transformList [1, 2, 3, 4])

