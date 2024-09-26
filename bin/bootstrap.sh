#!/usr/bin/env sh

set -e

GITHUB_USER="alessio-libardi"
GITHUB_REPO="dotfiles"

BASEDIR="${HOME}/.config/${GITHUB_REPO}"

git clone https://github.com/"${GITHUB_USER}"/"${GITHUB_REPO}".git --recursive "${BASEDIR}"

sh "${BASEDIR}/bin/update.sh"
