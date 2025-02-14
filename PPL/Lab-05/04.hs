data Color = Red | Green | Blue

describeColor :: Color -> String
describeColor Red = "This is Red"
describeColor Green = "This is Green"
describeColor Blue = "This is Blue"

main :: IO ()
main = do
  print (describeColor Red)
  print (describeColor Blue)

