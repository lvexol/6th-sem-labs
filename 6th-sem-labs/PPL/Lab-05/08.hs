listLength :: [a] -> Int
listLength [] = 0
listLength (_:xs) = 1 + listLength xs

main :: IO ()
main = do
  print (listLength [1, 2, 3])
  print (listLength ([]:: [Int]))

