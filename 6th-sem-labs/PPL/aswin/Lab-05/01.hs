isZero :: Int -> String
isZero 0 = "Zero"
isZero _ = "Not Zero"

main :: IO ()
main = do
  print (isZero 0)
  print (isZero 5)
  print (isZero (-3))
