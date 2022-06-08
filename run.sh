#!/bin/sh

set -e
set -x

while true
do

./sync.sh
./build.sh
git commit -a -m "update"
git push github

sleep 6h

done
