#!/bin/sh

./tg-archive.sh -b --symlink

echo removing old symlinks
find . -maxdepth 1 -type l -print0 | xargs -0 rm

echo creating new symlinks
ln -s site/* ./
