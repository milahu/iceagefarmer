#!/bin/sh

tg_archive="../result/bin/tg-archive"

API_ID=""
API_HASH=""

. ./secret.sh

export API_ID
export API_HASH

"$tg_archive" "$@"
