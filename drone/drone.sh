#!/usr/bin/env bash
set -euo pipefail

if [ -n `which drone` ]; then
    echo 'drone is already installed'
    exit 0
fi

: ${DRONE_VERSION:='0.7'}
docker pull drone/drone:$DRONE_VERSION
