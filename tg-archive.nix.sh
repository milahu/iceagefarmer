#!/bin/sh

nix-build -E 'with import <nixpkgs> { }; callPackage ./tg-archive.nix { }'

