-- imported modules
import qualified Data.Set
import qualified Data.Sequence

-- Clip: Functional Collections

-- This is just a redefinition of the standard Haskell list type, 
-- without the syntactic sugar
-- Empty is equivalent to [] and Cons is equivalent to ::
data List a = Empty | Cons a (List a)

updateFirst :: List a -> a -> List a
updateFirst Empty y = Empty
updateFirst (Cons x xs) y = Cons y xs

-- Clip: Set
triple :: Int -> Int
triple x = x + x + x

triple' :: Int -> Int
triple' x = 3 * x

-- uncommenting the following is an error, as described in the clip
{-
funSet :: Data.Set.Set (Int -> Int)
funSet = Data.Set.insert triple Data.Set.empty

problem :: Bool
problem = Data.Set.member triple' funSet
-}

-- Clip: Seq
seqLength :: Seq a -> Int
seqLength (viewl -> EmptyL) = 0
seqLength (viewl -> x :< xs) = 1 + length xs

seqLength' :: Seq a -> Int
seqLength' (viewr -> EmptyR) = 0
seqLength' (viewr -> xs :> x) = 1 + length xs
