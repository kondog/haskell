module BowlingCalc( bowlingCalc ) where

-- get ScoreList out Score.
bowlingCalc :: [[Int]] -> Int
bowlingCalc input_list
    -- all socre are calculated.
    | input_list                           == [] = 0
    -- spare
    | ( sumNormalFrame $ head input_list ) == 10 = 
      ( sumNormalFrame     $ head input_list )        +
      ( sumFrameAfterSpare $ head $ tail input_list ) +
      ( bowlingCalc        $ tail $ tail input_list )
    -- normal pattern. not spare, strike.
    | otherwise          = ( sumNormalFrame $ head input_list ) + 
                           ( bowlingCalc $ tail input_list )
            
-- get 1frame out Sum. but not support Spare, Strike.
sumNormalFrame :: [Int] -> Int
sumNormalFrame one_frame
    | one_frame == [] = 0
    | otherwise       = head one_frame + 
                        ( sumNormalFrame $ tail one_frame )

-- get 1frame out Sum after Spare.
sumFrameAfterSpare :: [Int] -> Int
sumFrameAfterSpare one_frame
    | one_frame        == [] = 0
    | length one_frame == 2  = head one_frame * 2 +
                               ( sumFrameAfterSpare $ tail one_frame )
    | otherwise              = head one_frame +
                               ( sumFrameAfterSpare $ tail one_frame )



