#!/bin/sh
#   ______  ______    
#  /\__  _\/\  __ \     
#  \/_/\ \/\ \  __ \    By Tejas Agarwal 
#     \ \_\ \ \_\ \_\   https://github.com/tejasag 
#      \/_/  \/_/\/_/ 
#                     
pushd ~/.dotfiles/
sudo nixos-rebuild test --flake .#delphin
popd
