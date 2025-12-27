#!/bin/sh

nix-build -E 'with import <nixpkgs> { }; python3.pkgs.callPackage ./tg-archive.nix { }'

