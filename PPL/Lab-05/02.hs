countElements :: [a] -> Int
countElements [] = 0
countElements (_:xs) = 1 + countElements xs

main :: IO ()
main = do
  print (countElements [1, 2, 3])
  print (countElements [])
  print (countElements ["a", "b", "c", "d"])

