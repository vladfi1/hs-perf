module ANN where


import Data.Array.Accelerate

type Matrix e = Array DIM2 e

newtype ANN a = ANN { weights :: [Matrix a] }



--output :: (Num a) => ANN a -> (a -> a) -> Vector a -> Vector a

--output ANN {weights} activation input =
  
