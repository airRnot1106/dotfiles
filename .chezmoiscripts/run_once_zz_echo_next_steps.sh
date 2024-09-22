#!/bin/bash

set -eu

echo "Next Steps: Execute the following commands.
------------------------------------------
source ./set_env_variables.sh
$HOME/.local/bin/chezmoi cd
nix run
------------------------------------------
"
