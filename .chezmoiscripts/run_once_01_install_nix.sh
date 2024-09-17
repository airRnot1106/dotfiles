#!/bin/bash

set -eu

echo "Installing Nix..."

curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install

echo "Installation completed.\nNext Steps: Execute the following command.\nnix run nixpkgs#home-manager -- switch --flake .#airrnot"
