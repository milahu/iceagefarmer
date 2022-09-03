#!/bin/sh

set -e
set -x

sleep_minutes=60

while true
do

timeout 120 ./sync.sh
./build.sh
git status
git add media/ *.html site/*.html site/index.* # add new files
git commit -a -m "update" || true # allow to fail (no update)
git push || true # allow to fail (network errors)

echo "last run: $(date)"
echo "next run: $(date -d+${sleep_minutes}minutes)"
sleep ${sleep_minutes}m

done
