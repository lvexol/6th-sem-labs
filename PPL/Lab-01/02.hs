isEven :: Int -> Bool
isEven n = n `mod` 2 == 0
main :: IO ()
main = print (isEven 19)
