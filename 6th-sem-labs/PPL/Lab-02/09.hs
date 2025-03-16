swap :: (a, b) -> (b, a)
swap (x, y) = (y, x)

main :: IO ()
main = print (swap (1, "aswin"))

