#!/bin/sh

# Cloning settings files
echo "Fetching Permission files"
git clone https://tomasnorre@bitbucket.org/tomasnorre/bitbucket_knownhost.git /tmp/bitbucket_knownhost

echo "Copy script to /usr/local/bin"
cp -f /tmp/bitbucket_knownhost/known_hosts /root/.ssh/known_hosts

echo "Changing permissions"
chmod 775 /root/.ssh/known_hosts

echo "Cleaning Up!"
rm -rf /tmp/bitbucket_knownhost

echo "--Done--"
