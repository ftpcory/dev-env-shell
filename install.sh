#!/bin/bash

# if this is linux, do linux things
[[ "${OSTYPE}" == "linux"* ]] && {
  bin/install-linux
}   

# if this is a mac, do mac things
[[ "${OSTYPE}" == "darwin"* ]] && {
  bin/install-mac
}   

rsync -avz src/* "${HOME}"
