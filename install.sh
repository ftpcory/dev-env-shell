#!/usr/bin/env bash

mkdir -p "${HOME}/.credentials/mfa"
mkdir -p "${HOME}/.docker/cli-plugins"
mkdir -p "${HOME}/.vim"
mkdir -p "${HOME}/bin"

[[ -f main.zip ]] && rm -f main.zip*

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

cp src/.bashrc "${HOME}"
cp src/.bash_aliases "${HOME}"
cp src/.vimrc "${HOME}"
cp -r src/.vim/* "${HOME}/.vim"
cp -r src/bin/* "${HOME}/bin"

chmod +x "${HOME}/bin/"*
chmod +x "${HOME}/.docker/cli-plugins/"*
