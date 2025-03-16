listZipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
listZipWith _ [] _ = []
listZipWith _ _ [] = []
listZipWith f (x:xs) (y:ys) = f x y : listZipWith f xs ys

main :: IO ()
main = do
  print (listZipWith (+) [1, 2, 3] [4, 5, 6])
  print (listZipWith (*) [1, 2, 3] [4, 5, 6])
  print (listZipWith (\x y -> (x, y)) [1, 2] ["a", "b", "c"])

