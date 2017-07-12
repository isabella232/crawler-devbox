#!/bin/sh

# Cloning settings files
echo "Fetching Permission files"
git clone git@bitbucket.org:tomasnorre/chef-randomip_webhotels.git /tmp/permissions

echo "Copy script to /usr/local/bin"
cp -f /tmp/permissions/files/default/deployment_prepare_filesystem /usr/local/bin/deployment_prepare_filesystem
cp -f /tmp/permissions/files/default/deployment_secure_filesystem /usr/local/bin/deployment_secure_filesystem

echo "Changing permissions"
chmod a+x /usr/local/bin/deployment_prepare_filesystem
chmod a+x /usr/local/bin/deployment_secure_filesystem

echo "Cleaning Up!"
rm -rf /tmp/permissions

echo "--Done--"
