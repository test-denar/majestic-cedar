#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://dev-api.stackbit.com/project/5de644b8600c9a0012faabf7/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://dev-api.stackbit.com/pull/5de644b8600c9a0012faabf7
curl -s -X POST https://dev-api.stackbit.com/project/5de644b8600c9a0012faabf7/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://dev-api.stackbit.com/project/5de644b8600c9a0012faabf7/webhook/build/publish > /dev/null
