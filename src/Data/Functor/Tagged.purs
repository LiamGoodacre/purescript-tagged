module Data.Functor.Tagged (Tagged(), tagged, untagged) where

import Prelude
import Control.Alt (class Alt)
import Control.Comonad (class Comonad)
import Control.Extend (class Extend)
import Data.Foldable (class Foldable)
import Data.Functor.Invariant (class Invariant)
import Data.Identity (Identity(..))
import Data.Newtype (class Newtype)
import Data.Traversable (class Traversable)
import Data.Profunctor (class Profunctor)

newtype Tagged :: forall k. k -> Type -> Type
newtype Tagged t a = Tagged (Identity a)

tagged :: forall t a. a -> Tagged t a
tagged a = Tagged (Identity a)

untagged :: forall t a. Tagged t a -> a
untagged (Tagged (Identity a)) = a

instance newtypeTagged :: Newtype (Tagged t a) a

instance showTagged :: Show a => Show (Tagged t a) where
  show x = "(tagged " <> show (untagged x) <> ")"

-- copy useful instances from Identity
derive newtype instance traversableTagged :: Traversable (Tagged t)
derive newtype instance foldableTagged :: Foldable (Tagged t)
derive newtype instance comonadTagged :: Comonad (Tagged t)
derive newtype instance extendTagged :: Extend (Tagged t)
derive newtype instance monadTagged :: Monad (Tagged t)
derive newtype instance bindTagged :: Bind (Tagged t)
derive newtype instance applicativeTagged :: Applicative (Tagged t)
derive newtype instance applyTagged :: Apply (Tagged t)
derive newtype instance altTagged :: Alt (Tagged t)
derive newtype instance invariantTagged :: Invariant (Tagged t)
derive newtype instance functorTagged :: Functor (Tagged t)
--derive newtype instance divisionRingTagged :: DivisionRing a => DivisionRing (Tagged t a)
derive newtype instance commutativeRingTagged :: CommutativeRing a => CommutativeRing (Tagged t a)
derive newtype instance ringTagged :: Ring a => Ring (Tagged t a)
derive newtype instance euclideanRingTagged :: EuclideanRing a => EuclideanRing (Tagged t a)
derive newtype instance semiringTagged :: Semiring a => Semiring (Tagged t a)
derive newtype instance monoidTagged :: Monoid a => Monoid (Tagged t a)
derive newtype instance semigroupTagged :: Semigroup a => Semigroup (Tagged t a)
derive newtype instance booleanAlgebraTagged :: BooleanAlgebra a => BooleanAlgebra (Tagged t a)
derive newtype instance heytingAlgebraTagged :: HeytingAlgebra a => HeytingAlgebra (Tagged t a)
derive newtype instance boundedTagged :: Bounded a => Bounded (Tagged t a)
derive newtype instance ordTagged :: Ord a => Ord (Tagged t a)
derive newtype instance eqTagged :: Eq a => Eq (Tagged t a)

instance profunctorTagged :: Profunctor Tagged where
  dimap _ g (Tagged (Identity o)) = Tagged (Identity (g o))

