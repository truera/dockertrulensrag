#!/bin/bash

DOCKER_TAG=${DOCKER_TAG:-0.1}

git clone https://github.com/truera/trulens
docker build -t trulensrag:${DOCKER_TAG} .
rm -rf /tmp/trulens
