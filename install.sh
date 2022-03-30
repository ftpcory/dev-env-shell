#!/usr/bin/env bash

wget "https://github.com/ftpcory/dev-env-shell/archive/refs/heads/main.zip"
unzip -o main.zip
cd dev-env-shell-main

# if this is linux, do linux things
[[ "${OSTYPE}" == "linux"* ]] && {
  bin/install-linux
}   

# if this is a mac, do mac things
[[ "${OSTYPE}" == "darwin"* ]] && {
  bin/install-mac
}   

rsync -avz src/* "${HOME}"
