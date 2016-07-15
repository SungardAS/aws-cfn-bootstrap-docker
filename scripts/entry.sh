#!/bin/ash
set -e

if [ -e /scripts/"$1" ]; then
    /scripts/"$@"
else
    "$@"
fi
