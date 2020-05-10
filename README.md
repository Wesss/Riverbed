# Riverbed
Riverbed is a programming framework inspired by Flow Based Programming. In short, this library enables a plug-and-play style of programming where we define many black box components, then externally connect them together to define our program's control flow.

Currently, Riverbed has only been tested against Neko and Python targets.

## Advantages:
- High Level Views
  - Ever return to a project to find a jumbled mess of calls and callbacks? By extracting all of our control flow into the "top" of our program, we now have an place to re-orient ourselves and quickly split apart and dive into different parts of the program. Components can be composed of other components, allowing for further abstraction of large applications.
- Naturally Testable and Reusable
  - Components are just wrappers on single functions, which are inherently testable. As dependencies and dependants are hooked up externally, there's little need to write mocks/stubs and inject other dependencies during testing. Reusing components is just a matter of plugging them into new inputs/outputs, and finding existing components is made easy with our top-level view of the application.

## Disadvantages:
- Performance
  - Wrapping *every* method call can be expensive in both time and memory. This is probably not a good solution for performance-critical code.

## More:

See https://colab.coop/blog/how-to-start-flowing-with-flow-based-programming/ for more details on flow based programming in general.

# API

API will be fully documented with 1.0.0 release. For now, see `Flow` and `Util` class method documentation.

# Contributing

## First Time Setup
- download/install haxe/haxelib, set to version 4.0.5
- install dependencies
```
haxelib install utest
```

## Unit Testing
Run the unit tests with haxe interpreter:
```
haxe interpret-tests.hxml
```
Unit tests can be compiled to targets and run as well.
```
haxe compile-tests.hxml
```
, then run the files at build/test/ with their respective environments. see .circleci/config.yml for docker images that can run each target.


## Submitting Haxelib
1. In explorer, zip project directionry (ie. `Riverbed`)
2. `Haxelib submit Riverbed.zip <password>`