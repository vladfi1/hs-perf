{-# LANGUAGE NoMonomorphismRestriction #-}

module Main where

import LinAlg (testCols, testRows)

import Numeric.LinearAlgebra.Data
import Numeric.LinearAlgebra.HMatrix

import Data.Vector.Storable

import Prelude hiding (sum)

testMult n m = sum $ mat #> vec
  where
    mat = matrix n $ fmap fromIntegral [1..(n*m)]
    vec = fromList $ fmap fromIntegral [1..n]

main = print $ testMult testCols testRows
