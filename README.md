# Haxe Riverbed
Haxe Riverbed is a Haxe Framework inspried by Flow Based Programming

TODO inspiration, getting started, contributing

## Setup
TODO actually write out setup directions

1. install nodejs (https://nodejs.org/en/)
  - select option to add to path?
2. install yarn (https://yarnpkg.com/en/docs/install#windows-stable)
  - add the following to .bash_profile or .bashrc
  ```
  # yarn binary
  PATH=$PATH:/c/Program\ Files\ \(x86\)/Yarn/bin
  # dependencies installed via yarn
  PATH=$PATH:/c/Users/wesdev/AppData/Local/Yarn/bin
  ```

3. install haxeshim, switchx, and lix?
```
# Install all 3 tools and make their commands available.
yarn global add haxeshim switchx lix.pm
```

4. setup dependency manager?
```
# Create a ".haxerc" in the current directory, informing haxeshim that
# this project should use a specific version of Haxe and specific
# `haxe_libraries` dependencies
switchx scope create
# Use the latest stable version of Haxe in this project.
switchx install stable
```
