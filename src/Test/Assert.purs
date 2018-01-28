module Test.Assert
  ( ASSERT
  , assert
  , assert'
  , assertEqual
  , assertFalse
  , assertThrows
  , assertThrows'
  , assertTrue
  ) where

import Prelude

import Control.Monad.Eff (Eff, kind Effect)
import Control.Monad.Eff.Console (CONSOLE, error)

-- | Assertion effect type.
foreign import data ASSERT :: Effect

-- | Throws a runtime exception with message "Assertion failed" when the boolean
-- | value is false.
assert :: forall e. Boolean -> Eff (assert :: ASSERT | e) Unit
assert = assert' "Assertion failed"

-- | Throws a runtime exception with the specified message when the boolean
-- | value is false.
foreign import assert'
  :: forall e
   . String
  -> Boolean
  -> Eff (assert :: ASSERT | e) Unit

-- | Throws a runtime exception with message "Assertion failed: An error should
-- | have been thrown", unless the argument throws an exception when evaluated.
-- |
-- | This function is specifically for testing unsafe pure code; for example,
-- | to make sure that an exception is thrown if a precondition is not
-- | satisfied. Functions which use `Eff (err :: EXCEPTION | eff) a` can be
-- | tested with `catchException` instead.
assertThrows :: forall e a. (Unit -> a) -> Eff (assert :: ASSERT | e) Unit
assertThrows =
  assertThrows' "Assertion failed: An error should have been thrown"

-- | Throws a runtime exception with the specified message, unless the argument
-- | throws an exception when evaluated.
-- |
-- | This function is specifically for testing unsafe pure code; for example,
-- | to make sure that an exception is thrown if a precondition is not
-- | satisfied. Functions which use `Eff (err :: EXCEPTION | eff) a` can be
-- | tested with `catchException` instead.
assertThrows'
  :: forall e a
   . String
  -> (Unit -> a)
  -> Eff (assert :: ASSERT | e) Unit
assertThrows' msg fn = assert' msg =<< checkThrows fn

foreign import checkThrows
  :: forall e a
   . (Unit -> a)
  -> Eff (assert :: ASSERT | e) Boolean

-- | Compares the `expected` and `actual` values for equality and
-- | throws a runtime exception when the values are not equal.
-- |
-- | The message indicates the expected value and the actual value.
assertEqual
  :: forall a e
   . Eq a
  => Show a
  => { actual :: a, expected :: a }
  -> Eff (assert :: ASSERT, console :: CONSOLE | e) Unit
assertEqual {actual, expected} = do
  unless result $ error message
  assert' message result
  where
  message = "Expected: " <> show expected <> "\nActual:   " <> show actual
  result = actual == expected

-- | Throws a runtime exception when the value is `false`.
-- |
-- | The message indicates the expected value (`true`)
-- | and the actual value (`false`).
assertTrue
  :: forall e
   . Boolean
  -> Eff (assert :: ASSERT, console :: CONSOLE | e) Unit
assertTrue actual = assertEqual { actual, expected: true }

-- | Throws a runtime exception when the value is `true`.
-- |
-- | The message indicates the expected value (`false`)
-- | and the actual value (`true`).
assertFalse
  :: forall e
   . Boolean
  -> Eff (assert :: ASSERT, console :: CONSOLE | e) Unit
assertFalse actual = assertEqual { actual, expected: false }
