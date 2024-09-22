#!/bin/bash

set -eu

echo "Next Steps: Execute the following commands.
------------------------------------------
$HOME/.local/bin/chezmoi cd
source ./set_env_variables.sh
nix run
------------------------------------------
"
