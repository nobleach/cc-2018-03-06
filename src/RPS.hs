-- {-# LANGUAGE UnicodeSyntax #-}
module RPS
    ( toss
    ) where

import System.Random.Shuffle
import Data.List

toss :: IO ()
toss = do
    shuffled <- shuffleM getTosses
    putStrLn $ "Biff tossed " ++ head shuffled
    putStrLn $ "George tossed " ++ shuffled !! 4

getScissors :: [String]
getScissors = replicate 10 "✂️"

getPaper :: [String]
getPaper = replicate 10 "📝"

getRocks :: [String]
getRocks = replicate 10 "🗿"

getPossibilities :: [String] -> [String] -> [String] -> [String]
getPossibilities rocks paper scissors =
    rocks ++ paper ++ scissors

getTosses :: [String]
getTosses =
    getPossibilities getRocks getPaper getScissors
