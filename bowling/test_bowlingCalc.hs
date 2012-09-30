import BowlingCalc
import Test.HUnit

-- ボーリングは、各プレイヤーが10回のフレームで投球をし、
-- 倒したピンの数からスコアを計算します。第10フレーム以外
-- は最大で２回投球が可能で、第10フレームは最大で３回の投球を行えます。
-- スコアの計算方法は次の通りです。↲
-- ↲
-- 1. フレームにおいてスペア・ストライクがない場合
--    （オープンフレームと呼ぶ）、2回の投球で倒したピンの本数がその
--    フレームの得点となる。↲
-- 2. スペアを出した場合、倒した本数である10点に加え、
--    次の1投球で倒したピンの本数がこのフレームの得点に加算される。
-- 3. ストライクを出した場合、倒した本数である10点に加え、
--    続く2投球で倒したピンの本数が加算される。
--    つまり次の投球もストライクだった場合は、
--    さらにその次の投球（2フレーム先の第1投球）で倒したピンの本数まで加算される。
-- 4. 第10フレームのみ、スペア・ストライクを出した場合、
--    3投して倒したピンの総数を第10フレームの得点として計算する。
-- 5. 各フレームの得点の合計が1ゲームの得点となる。最高得点は300点となる。
-- 
-- Input: [[5,3],[7,2],[8,/],[X],[7,1],[9,-],[6,2],[X],[6,/],[8,-]]↲
-- Output: 126↲

-- test code.
isBowlingScoreRight src dst
    | ( bowlingCalc src ) == dst = True
    | otherwise = False

-- test cases.
test1 = TestCase( assertBool "the easiest pattern" 
    ( isBowlingScoreRight 
      [[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]] 
      20 )
    )

test2 = TestCase( assertBool "the easiest pattern" 
    ( not ( isBowlingScoreRight 
      [[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]] 
      21 )) 
    )

test3 = TestCase( assertBool "spare pattern"
    ( isBowlingScoreRight 
      [[5,5],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]] 
      ((10)+((1*2)+1)+(2*8)) )
    )

test4 = TestCase( assertBool "gutter pattern"
    ( isBowlingScoreRight 
      [[1,-],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]] 
      ((10)+((1*2)+1)+(2*8)) )
    )


-- wrap up tests.
tests = TestList [
    TestLabel "test1" test1,
    TestLabel "test2" test2,
    TestLabel "test3" test3
    ]

-- do test.
main = runTestTT tests

