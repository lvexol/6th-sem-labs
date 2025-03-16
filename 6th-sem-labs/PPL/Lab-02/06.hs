power :: Int -> Int -> Int
power _ 0 = 1
power b e = b * power b (e - 1)

main :: IO ()
main = print (power 5 3)

