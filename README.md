# Starter project for CS 442

Dune configuration to give a scaffold to write CS 442 OCaml code.

Includes idiomatic examples for testing, interfaces, and importing `Core`.

Also includes a Nix `shell.nix` that bulids this repo, and gives you an Ocaml 
IDE environment. I recommend using neovim with nvim-lspconfig.

See `src/twosum.ml` for some sample code, and `test/twosum.ml` for how I test 
that code. Remember that all exports from `src/` must be mentioned in 
`src/cs442.ml` and `src/cs442.mli`

# Building

## Using [Nix](https://github.com/NixOS/nix)

Run `nix-shell`, then run `dune test` to run the tests.

## Not using Nix

Follow the course note instructions for setting up `opam` and using `opam` to 
install `core`. Then run `dune test` to run the tests.

# Submitting

With the structure of this repo, you can still submit files according to the 
requirements. Just symlink them to the folder you're submitting from, and as 
long as you didn't import anything other then core, you should be good to go.

The course builds ocaml files without dune. If you have a file `src/xyz.ml`, you 
can run `./try_build.sh xyz` to see if it will build using the compilation 
instructions the course uses.
