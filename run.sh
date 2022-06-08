#!/bin/sh

set -e
set -x

while true
do

./sync.sh
./build.sh
git commit -a -m "update"
git push github

echo "last run: $(date)"
echo "next run: $(date -d+6hours)"
sleep 6h

done
