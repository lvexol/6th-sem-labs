firstNElements :: Int -> [a] -> [a]
firstNElements _ [] = []
firstNElements 0 _ = []
firstNElements n (x:xs) = x : firstNElements (n-1) xs

main :: IO ()
main = print (firstNElements 3 [1, 2, 4, 5, 5, 6, 2, 3])

