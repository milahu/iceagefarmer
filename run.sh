#!/bin/sh

set -e
set -x

sleep_minutes=60

while true
do

./sync.sh
./build.sh
git commit -a -m "update"
git push github

echo "last run: $(date)"
echo "next run: $(date -d+${sleep_minutes}minutes)"
sleep ${sleep_minutes}m

done
