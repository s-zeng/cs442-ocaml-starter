{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/refs/tags/22.11.tar.gz") {} }:

pkgs.mkShell {
  nativeBuildInputs = with pkgs; [ 
    ocaml
    dune_3 
  ];

  buildInputs = with pkgs; [
    ocamlPackages.core
    ocamlPackages.findlib # required for dune to find core -- don't import this in your own code
  ];

  # dev environment stuff
  packages = with pkgs; [
    ocamlPackages.ocaml-lsp # language server
    ocamlPackages.utop # repl
    ocamlformat
  ];
}

