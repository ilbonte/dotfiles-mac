#!/usr/bin/env bash

echo "Detecting OS..."

case "$(uname)" in
"Darwin")
  echo "Detected MacOS!"
  bash ./os/mac/config.sh
  ;;
*)
  echo "Unsupported OS configuration!"
  exit 1
  ;;
esac
