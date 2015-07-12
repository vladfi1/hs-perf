--{-# LANGUAGE NoImplicitPrelude #-}
--{-# LANGUAGE NoMonomorphismRestriction #-}
--{-# LANGUAGE PartialTypeSignatures #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE NoMonomorphismRestriction #-}

module LinAlg where

import Data.Array.Accelerate
import Data.Array.Accelerate.Interpreter

--import Control.Monad.Random

import Prelude hiding (zipWith, replicate, (++), sum)

--dotp :: Vector Float -> Vector Float -> Acc (Scalar Float)
dotp xs ys = let xs' = use xs
                 ys' = use ys
             in
             fold (+) 0 (zipWith (*) xs' ys')

--rows :: Int -> _
rows :: Elt e
     => Exp Int
     -> Acc (Array (Z :. Int) e)
     -> Acc (Array (Z :. Int :. Int) e)
rows n = replicate (lift $ Z :. n :. All)

mult m v = fold1 (+) $ zipWith (*) m vs
  where
    n = indexHead . indexTail $ shape m
    vs = rows n v


vec :: Array (Z :. Int) Int
vec = fromList (Z :. (3 :: Int)) [1, 2, 3]

mat :: Array (Z :. Int :. Int) Int
mat = fromList (Z :. (2 :: Int) :. (3 :: Int)) [1, 1, -1, 0, 1, 0]

result = run $ mult (use mat) (use vec)

testMult n m = sum $ mult (use mat) (use vec)
  where
    mat = fromList (Z :. m :. n) [(1::Double)..]
    vec = fromList (Z :. n) [1..]
