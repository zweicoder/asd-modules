#!/usr/bin/env bash
set -euo pipefail

if [ -n `which gopass` ]; then
    echo 'gopass is already installed'
    exit 0
fi

wget https://www.justwatch.com/gopass/releases/1.2.0/gopass-1.2.0-linux-amd64.deb -P /tmp
sudo dpkg -i /tmp/gopass-1.2.0-linux-amd64.deb
