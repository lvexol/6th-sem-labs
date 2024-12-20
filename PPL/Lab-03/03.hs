absolute :: Float -> Float
absolute x = if x < 0 then -x else x
main :: IO ()
main = print (absolute (-10.5))
