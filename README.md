# Haxe Riverbed
Haxe Riverbed is a Haxe Framework inspried by Flow Based Programming

TODO inspiration

# Contributing

## First Time Setup
Lix is used as our dependency manager. It uses switchx and haxeshim as dependencies.
All three must be downloaded through yarn, which is a nodejs package manager.
That in turn means we also need nodejs.

1. install nodejs (https://nodejs.org/en/)
2. install yarn (https://yarnpkg.com/en/docs/install#windows-stable)
3. Add yarn executable and yarn-installed executables to your path.
  - Add the following to your .bash_profile or .bashrc
```
# yarn binary
PATH=$PATH:/c/Program\ Files\ \(x86\)/Yarn/bin
# dependencies installed via yarn
PATH=$PATH:/c/Users/${UserName}/AppData/Local/Yarn/bin
```

3. install haxeshim, switchx, and lix
```
yarn global add haxeshim switchx lix.pm
```

4. install dependencies
```
mkdir haxe_libraries
lix download
```

## Switching Context

1. switch to current branch's dependencies
```
lix download
```

## Unit Testing
`munit` is our unit testing framework. At the time of writing, it is not compatible with lix.
Download it and all dependencies via
```
haxelib install munit
haxelib install hamcrest
haxelib install hxcpp
haxelib install hxjava
haxelib install hxcs
haxelib install hxnodejs
```

Then optionally alias munit
```
alias munit='haxelib run munit'
```

Run the full test suite via
```
munit test
```
