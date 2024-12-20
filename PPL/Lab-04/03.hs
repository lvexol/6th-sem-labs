filterEven :: [Int] -> [Int]
filterEven = filter odd

main :: IO ()
main = do
  print (filterEven [1, 2, 3, 4, 5, 6])
  print (filterEven [10, 15, 20, 25])

