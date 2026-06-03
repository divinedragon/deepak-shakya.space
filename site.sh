#!/bin/bash

source ~/.bashrc

set -euo pipefail

# Enable detailed output when --verbose is passed
if [[ "$*" == *--verbose* ]]; then
    set -x
fi

run() {
    rm public -fr
    hugo server --baseURL="http://localhost:1313" --buildDrafts --buildFuture | spacer
}

build() {
    echo "Building the site..."
}

ci() {
    echo "Executing CI build..."
}

case "$1" in
    run)
        run
        ;;
    build)
        build
        ;;
    ci)
        ci
        ;;
    *)
        echo "Usage: $0 {run|build|ci}"
        exit 1
        ;;
esac
