#!/bin/sh
pushd ~/.dotfiles/delphin
nix flake update
popd
