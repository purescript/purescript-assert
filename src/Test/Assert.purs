module Test.Assert where

import Control.Monad.Eff (Eff())

-- | Assertion effect type.
foreign import data ASSERT :: !

-- | Throws a runtime exception with message "Assertion failed" when the boolean
-- | value is false.
assert :: forall e. Boolean -> Eff (assert :: ASSERT | e) Unit
assert = assert' "Assertion failed"

-- | Throws a runtime exception with the specified message when the boolean
-- | value is false.
foreign import assert' :: forall e. String -> Boolean -> Eff (assert :: ASSERT | e) Unit
