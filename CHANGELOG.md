# Changelog

Notable changes to this project are documented in this file. The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

Breaking changes:

New features:

Bugfixes:

Other improvements:
- Generated changelog and added PR template (#18 #19)
- Migrated to GitHub Actions and updated installation instructions (#17)
- Updated psa to v0.8.0
- Removed primes from foreign modules exports
- Removed `return {}` from FFI functions
- Bumped pulp version (#14)
- Updated CI (#13)

## [v4.1.0](https://github.com/purescript/purescript-assert/releases/tag/v4.1.0) - 2019-02-09

Added `assertEqual'`, `assertTrue'`, `assertFalse'` functions that print messages with "Expected" and "Actual" values shown (@8084)

## [v4.0.0](https://github.com/purescript/purescript-assert/releases/tag/v4.0.0) - 2018-05-22

Updated for PureScript 0.12

## [v3.1.0](https://github.com/purescript/purescript-assert/releases/tag/v3.1.0) - 2018-03-22

- Added `assertEqual`, `assertTrue`, `assertFalse` (@joneshf)

## [v3.0.0](https://github.com/purescript/purescript-assert/releases/tag/v3.0.0) - 2017-03-25

- Updated for PureScript 0.11

## [v2.0.0](https://github.com/purescript/purescript-assert/releases/tag/v2.0.0) - 2016-10-02

- Updated dependencies

## [v1.0.0](https://github.com/purescript/purescript-assert/releases/tag/v1.0.0) - 2016-06-01

This release is intended for the PureScript 0.9.1 compiler and newer.

**Note**: The v1.0.0 tag is not meant to indicate the library is “finished”, the core libraries are all being bumped to this for the 0.9 compiler release so as to use semver more correctly.

## [v1.0.0-rc.1](https://github.com/purescript/purescript-assert/releases/tag/v1.0.0-rc.1) - 2016-03-13

- Release candidate for the psc 0.8+ core libraries

## [v0.1.1](https://github.com/purescript/purescript-assert/releases/tag/v0.1.1) - 2015-07-29

- Added `assertThrows` for testing unsafe functions (@hdgarrood)

## [v0.1.0](https://github.com/purescript/purescript-assert/releases/tag/v0.1.0) - 2015-06-30

This release works with versions 0.7.\* of the PureScript compiler. It will not work with older versions. If you are using an older version, you should require an older, compatible version of this library.

## [v0.1.0-rc.1](https://github.com/purescript/purescript-assert/releases/tag/v0.1.0-rc.1) - 2015-06-06

Initial release candidate.

