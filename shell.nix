{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/refs/tags/22.11.tar.gz") { } }:

let
  ocamlPackages = pkgs.ocaml-ng.ocamlPackages_4_08;
in
pkgs.mkShell {
  nativeBuildInputs = with ocamlPackages; [
    ocaml
    dune_2
  ];

  buildInputs = [
    ocamlPackages.core
    ocamlPackages.findlib # required for dune to find core -- don't import this in your own code
  ];

  # dev environment stuff
  packages = [
    ocamlPackages.ocaml-lsp # language server
    ocamlPackages.utop # repl
    pkgs.ocamlformat
  ];
}

