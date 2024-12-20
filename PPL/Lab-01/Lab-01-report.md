# 20CYS312 - Principles of Programing Languages - Lab Exercise

---

## 1. Basic Arithmetic:

### Exercise 01 :Open GHCi and perform basic arithmetic operations:

![image.png](20CYS312%20-%20Principles%20of%20Programing%20Languages%20-%20La%2014db7a782d5780aba5dff5370f1ecf8c/image.png)

### Exercise 02 :Define a function to calculate the square of a number:

```jsx
square :: Int -> Int
square x = x * x

main :: IO ()
main = print (square 5)
```

![image.png](20CYS312%20-%20Principles%20of%20Programing%20Languages%20-%20La%2014db7a782d5780aba5dff5370f1ecf8c/image%201.png)

```jsx
square :: Int -> Int
square x = x * x

main :: IO ()
main = print (square 50)
```

![image.png](20CYS312%20-%20Principles%20of%20Programing%20Languages%20-%20La%2014db7a782d5780aba5dff5370f1ecf8c/image%202.png)

## 2. Defining and Using Lists:

### Exercise 3: Create a list of numbers and compute the sum of the list:

```jsx
sumList :: [Int] -> Int
sumList [] = 0
sumList (x:xs) = x + sumList xs

main :: IO ()
main = print(sumList [10,20,30])
```

![image.png](20CYS312%20-%20Principles%20of%20Programing%20Languages%20-%20La%2014db7a782d5780aba5dff5370f1ecf8c/image%203.png)

## 3. Pattern Matching with Lists:

### Exercise 4: Write a function to check if a list is empty:

```jsx
isEmpty :: [a] -> Bool
isEmpty [] = True
isEmpty _ = False

main :: IO ()
main = do
  print (isEmpty [10])
  print (isEmpty [])
  print (isEmpty [10,20,30])
```

![image.png](20CYS312%20-%20Principles%20of%20Programing%20Languages%20-%20La%2014db7a782d5780aba5dff5370f1ecf8c/image%204.png)

## 4. Simple IO Operations:

### Exercise 5: Write a program that asks the user for their name and prints a
greeting:

```jsx
main :: IO ()
main = do
 putStrLn "What is your name?"
 name <- getLine
 putStrLn ("Hello, " ++ name)
```

![image.png](20CYS312%20-%20Principles%20of%20Programing%20Languages%20-%20La%2014db7a782d5780aba5dff5370f1ecf8c/image%205.png)