#!/usr/bin/env bash

echo "Detecting OS..."

case $(uname -s) in
Darwin)
  echo "Detected MacOS!"
  bash ./os/mac/config.sh
  ;;
*)
  echo "Unsupported OS configuration!"
  ;;
esac
