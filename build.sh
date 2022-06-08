#!/bin/sh

./tg-archive.sh -b --symlink

echo removing old symlinks
find . -maxdepth 1 -type l -print0 | xargs -0 rm

echo creating new symlinks
ln -s site/* ./ || true # allow to fail

echo making timeless build
# https://github.com/knadh/tg-archive/issues/68
sed -i -E 's|<lastBuildDate>[^<]+</lastBuildDate>||g' site/index.xml
sed -i -E 's|<updated>[^<]+</updated>||g' site/index.atom

echo prettify xml to reduce diff noise
sed -i 's/></>\n</g' site/index.atom site/index.xml
