#!/bin/sh
pushd ~/.dotfiles/
nix flake update
popd
