firstElement :: Show a => [a] -> String
firstElement [] = "Empty list"
firstElement (x:_) = "First element is " ++ show x

main :: IO ()
main = do
  print (firstElement [1, 2, 3])  -- Non-empty list
  print (firstElement ([] :: [Int]))  
