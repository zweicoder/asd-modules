#!/usr/bin/env bash

set -euo pipefail

if [ -n `which docker-compose` ]; then
    echo 'docker-compose is already installed'
    exit 0
fi

# TODO automagically find latest version
: ${DOCKER_COMPOSE_VERSION:='1.14.0'}

# TODO prescript to chown if not owned by user?
curl -L https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose
