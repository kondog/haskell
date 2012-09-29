module BowlingCalc( bowlingCalc ) where

bowlingCalc :: [a] -> Int
bowlingCalc input_list
    | input_list == [] = 0
    | otherwise do 
            sum1Frame   $ head input_list
            bowlingCalc $ tail input_list
            

