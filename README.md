# Haxe Riverbed
Haxe Riverbed is a Haxe Framework inspried by Flow Based Programming

TODO inspiration, getting started, contributing

## Setup
TODO actually write out setup directions

1. install nodejs (https://nodejs.org/en/)
2. install yarn (https://yarnpkg.com/en/docs/install#windows-stable)
3. Add yarn executable and yarn-installed executables to your path.
  - Add the following to your .bash_profile or .bashrc
```
# yarn binary
PATH=$PATH:/c/Program\ Files\ \(x86\)/Yarn/bin
# dependencies installed via yarn
PATH=$PATH:/c/Users/wesdev/AppData/Local/Yarn/bin
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
