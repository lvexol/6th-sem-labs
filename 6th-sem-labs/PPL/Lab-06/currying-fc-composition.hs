compose :: (b -> c) -> (a -> b) -> a -> c
compose f g = \x -> f (g x)

main = do
    let multiplyBy2 = (* 2)
    let subtract3 = subtract 3
    let composedFunc = compose multiplyBy2 subtract3
    print (map composedFunc [1, 2, 3, 4])
    print (map composedFunc [5, 6, 7, 8])
    print (map composedFunc [0, -1, 2, 4])
    print (map composedFunc [10, 15, 20])

