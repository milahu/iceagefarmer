#!/bin/sh

set -e
set -x

#sleep_minutes=60
sleep_minutes=$((60 * 12)) # 12 hours

while true
do

# no, this fails to read from stdin at
# "Please enter your phone (or bot token): "
# https://github.com/LonamiWebs/Telethon/blob/05b848885810b5c2633197f87094ec3bfc330f0f/telethon/client/auth.py#L22
# timeout 120 ./sync.sh
script -q -c "timeout 120 ./sync.sh" /dev/null

./build.sh
git status
git add media/ *.html site/*.html site/index.* # add new files
git commit -a -m "update" || true # allow to fail (no update)
git push || true # allow to fail (network errors)

echo "last run: $(date)"
echo "next run: $(date -d+${sleep_minutes}minutes)"
sleep ${sleep_minutes}m

done
