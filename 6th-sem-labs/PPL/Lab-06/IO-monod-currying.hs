applyOp :: (Int -> Int -> Int) -> [Int] -> Int
applyOp op (x:xs) = foldl op x xs
applyOp _ [] = 0

main :: IO ()
main = do
  putStrLn "Enter operation (+ or *):"
  op <- getLine
  putStrLn "Enter two numbers:"
  num1 <- readLn
  num2 <- readLn
  let operation = if op == "+" then (+) else (*)
  print (applyOp operation [num1, num2])

