#!/usr/bin/env bash

set -e

CONFIG="config.yaml"
DOTBOT_DIR="bot"

DOTBOT_BIN="bin/dotbot"
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"/..

cd "${BASEDIR}"
git -C "${DOTBOT_DIR}" submodule sync --quiet --recursive
git submodule update --init --recursive "${DOTBOT_DIR}"

echo "${BASEDIR}/${DOTBOT_DIR}/${DOTBOT_BIN} ${BASEDIR} ${CONFIG}"
"${BASEDIR}/${DOTBOT_DIR}/${DOTBOT_BIN}" -d "${BASEDIR}" -c "${CONFIG}" "${@}"
