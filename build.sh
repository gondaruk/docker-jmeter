#!/usr/bin/env bash

set -euo pipefail

JMETER_VERSION=${JMETER_VERSION:-"5.5"}
IMAGE_TIMEZONE=${IMAGE_TIMEZONE:-"UTC"}

build() {
  local IMAGE_BASE="$1"

  docker build \
    --build-arg "JMETER_VERSION=${JMETER_VERSION}" \
    --build-arg "TZ=${IMAGE_TIMEZONE}" \
    -t "gondaruk/jmeter:${JMETER_VERSION}-${IMAGE_BASE}" \
    -f "./docker/${IMAGE_BASE}/Dockerfile" .
}

build alpine
build ubuntu
