
type Student = (String, Int, [Int])

averageMarks :: [Int] -> Float
averageMarks [] = 0 
averageMarks marks = fromIntegral (sum marks) / fromIntegral (length marks)

displayStudentAverages :: [Student] -> IO ()
displayStudentAverages [] = return () 
displayStudentAverages ((name, _, marks):xs) = do
    let avg = averageMarks marks
    putStrLn (name ++ "'s average marks: " ++ show avg)
    displayStudentAverages xs 

main :: IO ()
main = do
    let students = [ ("John", 1, [85, 90, 78, 92])
                   , ("Jane", 2, [88, 76, 91, 85])
                   , ("Tom", 3, [79, 82, 88, 85])
                   ]
    displayStudentAverages students  

