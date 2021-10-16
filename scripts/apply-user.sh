#!/bin/sh
#   ______  ______    
#  /\__  _\/\  __ \     
#  \/_/\ \/\ \  __ \    By Tejas Agarwal 
#     \ \_\ \ \_\ \_\   https://github.com/tejasag 
#      \/_/  \/_/\/_/ 
#                     
pushd ~/.dotfiles/

if [[ $1 == "minimal" ]] ; then
    nix build .#homeManagerConfigurations.minimal.activationPackage
else
    nix build .#homeManagerConfigurations.tejasagarwal.activationPackage
fi

./result/activate
popd
