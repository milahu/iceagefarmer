#!/bin/sh

# note:
#
# ./result/ is the result of nix-build
# see tg-archive.nix
#
# alternative to nix-build:
# install tg-archive with pip:
# pip install git+https://github.com/knadh/tg-archive
#
tg_archive="./result/bin/tg-archive"

API_ID=""
API_HASH=""

. ./secret.sh

export API_ID
export API_HASH

"$tg_archive" "$@"
