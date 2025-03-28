addPairs :: [(Int, Int)] -> [Int]
addPairs [] = []
addPairs ((x, y):xs) = (x + y) : addPairs xs

main :: IO ()
main = print (addPairs [(1, 2), (3, 2), (5, 2)])

