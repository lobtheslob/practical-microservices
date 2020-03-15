#!/bin/bash
echo -e "node version: `node --version`"
echo -e "npm version: `npm --version`"

export BABEL_ENV=test

if [[ $DEBUG_MODE = "DEBUG" ]]; then
    echo "Running with inspect-brk, must attach to continue"
    npm run inspect:test
else
    npm run test-local
fi

