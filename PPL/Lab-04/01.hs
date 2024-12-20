swapTuple :: (a, b) -> (b, a)
swapTuple (x, y) = (y, x)

main :: IO ()
main = do
  print (swapTuple (1, "Hello"))
  print (swapTuple ("First", "Second"))

