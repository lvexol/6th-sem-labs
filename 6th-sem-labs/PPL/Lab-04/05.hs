reverseList :: [a] -> [a]
reverseList [] = []
reverseList (x:xs) = reverseList xs ++ [x]

main :: IO ()
main = do
  print (reverseList [1, 2, 3] :: [Int])  -- specify the type as [Int]
  print (reverseList ["a", "b", "c"] :: [String])  -- specify the type as [String]
  print (reverseList [] :: [Int])  -- specify the type as [Int]

