#!/bin/bash

# Move into the project root
dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
cd "$dir"

# A shell script which publishes all packages to a local Verdaccio registry for testing / local dev purposes

if [[ -z "${VERDACCIO_URL}" ]]; then
  VERDACCIO=http://localhost:4873/
else
  VERDACCIO="${VERDACCIO_URL}"
fi

echo "Publishing to Verdaccio @ $VERDACCIO"

cd ../packages/admin-ui-plugin && bun publish -reg $VERDACCIO &&\
cd ../asset-server-plugin && bun publish -reg $VERDACCIO &&\
cd ../common && bun publish -reg $VERDACCIO &&\
cd ../core && bun publish -reg $VERDACCIO &&\
cd ../create && bun publish -reg $VERDACCIO &&\
cd ../elasticsearch-plugin && bun publish -reg $VERDACCIO &&\
cd ../email-plugin && bun publish -reg $VERDACCIO &&\
cd ../payments-plugin && bun publish -reg $VERDACCIO &&\
cd ../testing && bun publish -reg $VERDACCIO &&\
cd ../ui-devkit && bun publish -reg $VERDACCIO &&\
cd ../job-queue-plugin && bun publish -reg $VERDACCIO &&\
cd ../cli && bun publish -reg $VERDACCIO &&\
cd ../harden-plugin && bun publish -reg $VERDACCIO &&\
cd ../stellate-plugin && bun publish -reg $VERDACCIO &&\
cd ../sentry-plugin && bun publish -reg $VERDACCIO &&\
cd ../admin-ui/package && bun publish -reg $VERDACCIO
