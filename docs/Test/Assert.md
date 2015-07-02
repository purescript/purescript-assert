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


