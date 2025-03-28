maxOfTwo :: Int -> Int -> Int
maxOfTwo x y = if x > y then x else y

main :: IO ()
main = print (maxOfTwo 10 5)

