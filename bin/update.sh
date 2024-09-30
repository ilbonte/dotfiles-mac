#!/usr/bin/env bash

set -e

CONFIG="config.yaml"
DOTBOT_DIR="bot"

DOTBOT_BIN="bin/dotbot"
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"/..

cd "${BASEDIR}"

git pull
git submodule foreach --recursive git submodule sync --quiet
git submodule update --init --recursive

"${BASEDIR}/${DOTBOT_DIR}/${DOTBOT_BIN}" -d "${BASEDIR}" -c "${CONFIG}" "${@}"
