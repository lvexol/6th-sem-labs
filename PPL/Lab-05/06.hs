firstTwoElements :: [a] -> [a]
firstTwoElements (x:y:_) = [x, y]
firstTwoElements xs = xs

main :: IO ()
main = do
  print (firstTwoElements [1, 2, 3])
  print (firstTwoElements [10])
  print (firstTwoElements ([]:: [Int]))

