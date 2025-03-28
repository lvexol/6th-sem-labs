describePair :: (Int, Int) -> String
describePair (0, 0) = "Origin"
describePair (0, _) = "X-Axis"
describePair (_, 0) = "Y-Axis"
describePair _ = "Other"

main :: IO ()
main = do
  print (describePair (0, 0))
  print (describePair (0, 5))
  print (describePair (3, 0))
  print (describePair (2, 3))

