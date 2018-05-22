module Test.Assert
  ( assert
  , assert'
  , assertEqual
  , assertFalse
  , assertThrows
  , assertThrows'
  , assertTrue
  ) where

import Prelude

import Effect (Effect)
import Effect.Console (error)

-- | Throws a runtime exception with message "Assertion failed" when the boolean
-- | value is false.
assert :: Boolean -> Effect Unit
assert = assert' "Assertion failed"

-- | Throws a runtime exception with the specified message when the boolean
-- | value is false.
foreign import assert'
  :: String
  -> Boolean
  -> Effect Unit

-- | Throws a runtime exception with message "Assertion failed: An error should
-- | have been thrown", unless the argument throws an exception when evaluated.
-- |
-- | This function is specifically for testing unsafe pure code; for example,
-- | to make sure that an exception is thrown if a precondition is not
-- | satisfied. Functions which use `Effect a` can be
-- | tested with `catchException` instead.
assertThrows :: forall a. (Unit -> a) -> Effect Unit
assertThrows =
  assertThrows' "Assertion failed: An error should have been thrown"

-- | Throws a runtime exception with the specified message, unless the argument
-- | throws an exception when evaluated.
-- |
-- | This function is specifically for testing unsafe pure code; for example,
-- | to make sure that an exception is thrown if a precondition is not
-- | satisfied. Functions which use `Effect a` can be
-- | tested with `catchException` instead.
assertThrows'
  :: forall a
   . String
  -> (Unit -> a)
  -> Effect Unit
assertThrows' msg fn = assert' msg =<< checkThrows fn

foreign import checkThrows
  :: forall a
   . (Unit -> a)
  -> Effect Boolean

-- | Compares the `expected` and `actual` values for equality and
-- | throws a runtime exception when the values are not equal.
-- |
-- | The message indicates the expected value and the actual value.
assertEqual
  :: forall a
   . Eq a
  => Show a
  => { actual :: a, expected :: a }
  -> Effect Unit
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
  :: Boolean
  -> Effect Unit
assertTrue actual = assertEqual { actual, expected: true }

-- | Throws a runtime exception when the value is `true`.
-- |
-- | The message indicates the expected value (`false`)
-- | and the actual value (`true`).
assertFalse
  :: Boolean
  -> Effect Unit
assertFalse actual = assertEqual { actual, expected: false }
