#!/bin/bash

set -eu

echo "Cleanup startup scripts..."
if test -d ~/startup; then
    rm -rf ~/startup
fi
