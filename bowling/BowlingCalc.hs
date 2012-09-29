module BowlingCalc( bowlingCalc ) where

-- get ScoreList out Score.
bowlingCalc :: [[Int]] -> Int
bowlingCalc input_list
    | input_list == [] = 0
    | otherwise          = ( sumNormalFrame $ head input_list ) + ( bowlingCalc $ tail input_list )
            
-- get 1frame out Sum. but not support Spare, Strike.
sumNormalFrame :: [Int] -> Int
sumNormalFrame one_frame
    | one_frame == [] = 0
    | otherwise       = head one_frame + ( sumNormalFrame $ tail one_frame )

