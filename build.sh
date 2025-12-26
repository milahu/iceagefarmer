#!/bin/sh

./tg-archive.sh -b --symlink

echo removing old symlinks
find . -maxdepth 1 -type l -not -name result -print0 | xargs -0 rm

echo creating new symlinks
ln -s site/* ./ || true # allow to fail

echo making timeless build
# https://github.com/knadh/tg-archive/issues/68
sed -i -E 's|<lastBuildDate>[^<]+</lastBuildDate>||g' site/index.xml
sed -i -E 's|<updated>[^<]+</updated>||g' site/index.atom

#echo prettify xml to reduce diff noise
#sed -i 's/></>\n</g' site/index.atom site/index.xml
# done in https://github.com/knadh/tg-archive/pull/70

echo remove trailing whitespace
sed -i -E 's/ +$//' site/*.{html,xml,atom}

# fix: "tg-archive -b" does no longer preserve HTML in site_description
echo patching site_description
sed -i 's|{{{{{site_description}}}}}|<br>Telegram archive<br><div class="github-url" style="display:inline">(<a href="https://github.com/milahu/iceagefarmer">Github</a>)</div>|' site/*.{html,xml,atom}
