fizzbuzz input
    | (input `mod` 15 == 0) = "fizzbuzz"
    | (input `mod`  3 == 0) = "fizz"
    | (input `mod`  5 == 0) = "buzz"
    | otherwise             = show input
main = print $ map fizzbuzz [1..100]
