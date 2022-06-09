#!/bin/sh

set -e
set -x

sleep_minutes=60

while true
do

./sync.sh
./build.sh
git add media/ # add new files
git commit -a -m "update" || true # allow to fail (no update)
git push

echo "last run: $(date)"
echo "next run: $(date -d+${sleep_minutes}minutes)"
sleep ${sleep_minutes}m

done
