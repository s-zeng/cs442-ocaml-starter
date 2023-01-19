#!/usr/bin/env bash
#

if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    exit 1
fi

mkdir -p ./tmp
cp ./src/$1.ml ./tmp
ocamlfind ocamlc -package core,stdio -linkpkg -thread -o ./tmp/$1 ./tmp/$1.ml
./tmp/$1
rm -rf ./tmp
