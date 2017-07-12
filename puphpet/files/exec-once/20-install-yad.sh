#!/usr/bin/env bash

# Cloning settings files
echo "Fetching settings files"
git clone git@bitbucket.org:tomasnorre/crawler-devbox.git /tmp/crawler-devbox

echo "Adding YAD deployment scripts"
mkdir -p /etc/yad/

cd /etc/yad/
git clone https://github.com/AOE-T3Rookies-2016/YAD.git deploy

mkdir -p /etc/yad/crawler/typo3/
cd /etc/yad/crawler/typo3/
cp -f /tmp/crawler-devbox/share/etc/yad/crawler/typo3/devbox.sh devbox.sh

cd /usr/local/bin/
cp -f /tmp/crawler-devbox/share/usr/local/bin/yad_crawler_typo3_devbox yad_crawler_typo3_devbox
chmod +x yad_crawler_typo3_devbox

echo "Cleaning Up!"
rm -rf /tmp/crawler-devbox

echo "--Done--"
