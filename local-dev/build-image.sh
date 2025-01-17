#!/bin/sh

set -e

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
CONTEXT_DIR=$(cd "$SCRIPT_DIR/.." && pwd)

cd "${CONTEXT_DIR}"

./local-dev/build.sh

docker build -t littlehorse/lh-sso-workflow-bridge-ui:latest .
