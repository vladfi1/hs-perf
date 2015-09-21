module Main where

import LinAlg
import Data.Array.Accelerate.Interpreter

main = print $ run $ testMult testCols testRows
