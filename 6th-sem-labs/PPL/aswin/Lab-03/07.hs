incrementEach :: [Int] -> [Int]
incrementEach [] = []
incrementEach (x:xs) = (x + 1) : incrementEach xs

main :: IO ()
main = print (incrementEach [1, 2, 3, 4, 5])

