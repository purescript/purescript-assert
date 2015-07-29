## Module Test.Assert

#### `ASSERT`

``` purescript
data ASSERT :: !
```

Assertion effect type.

#### `assert`

``` purescript
assert :: forall e. Boolean -> Eff (assert :: ASSERT | e) Unit
```

Throws a runtime exception with message "Assertion failed" when the boolean
value is false.

#### `assert'`

``` purescript
assert' :: forall e. String -> Boolean -> Eff (assert :: ASSERT | e) Unit
```

Throws a runtime exception with the specified message when the boolean
value is false.

#### `assertThrows`

``` purescript
assertThrows :: forall e a. (Unit -> a) -> Eff (assert :: ASSERT | e) Unit
```

Throws a runtime exception with message "Assertion failed: An error should
have been thrown", unless the argument throws an exception when evaluated.

This function is specifically for testing unsafe pure code; for example,
to make sure that an exception is thrown if a precondition is not
satisfied. Functions which use `Eff (err :: EXCEPTION | eff) a` can be
tested with `catchException` instead.

#### `assertThrows'`

``` purescript
assertThrows' :: forall e a. String -> (Unit -> a) -> Eff (assert :: ASSERT | e) Unit
```

Throws a runtime exception with the specified message, unless the argument
throws an exception when evaluated.

This function is specifically for testing unsafe pure code; for example,
to make sure that an exception is thrown if a precondition is not
satisfied. Functions which use `Eff (err :: EXCEPTION | eff) a` can be
tested with `catchException` instead.


