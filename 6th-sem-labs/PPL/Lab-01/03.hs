isEmpty :: [a] -> Bool
isEmpty [] = True
isEmpty _ = False

main :: IO ()
main = do
  print (isEmpty [10])
  print (isEmpty [])
  print (isEmpty [10, 20, 30])

