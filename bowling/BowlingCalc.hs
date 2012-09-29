module BowlingCalc( bowlingCalc ) where

bowlingCalc :: [[Int]] -> Int
bowlingCalc input_list
    | input_list == [] = 0
    | otherwise          = ( sumNormalFrame $ head input_list ) + ( bowlingCalc $ tail input_list )
            
sumNormalFrame :: [Int] -> Int
sumNormalFrame one_frame
    | one_frame == [] = 0
    | otherwise       = head one_frame + ( sumNormalFrame $ tail one_frame )

