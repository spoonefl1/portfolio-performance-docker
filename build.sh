#/usr/bin/env bash

set -euo pipefail

VERSION=${VERSION:-0.50.3}
CONTAINER=sunside/portfolio-performance:${VERSION}

docker build --build-arg VERSION="${VERSION}" -t ${CONTAINER} .
