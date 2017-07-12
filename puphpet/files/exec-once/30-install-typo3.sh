#!/bin/bash
source "/etc/yad/crawler/typo3/devbox.sh"


echo "Dropping old database"
mysql -u${DB_USER} -p${DB_PASS} -e "DROP DATABASE IF EXISTS ${DB_NAME}"
mysql -u${DB_USER} -p${DB_PASS} -e "CREATE DATABASE ${DB_NAME}"

rm -rf -- /var/www/crawler/devbox
mkdir -p /var/www/crawler/

#cd /var/www/crawler/
#git clone git@bitbucket.org:tomasnorre/project-crawler.git devbox

#cd devbox
#composer update
#./vendor/bin/typo3cms install:setup --non-interactive #--database-user-name="${DB_USER}" --database-user-password="${DB_PASS}" #--database-host-name="localhost" --database-port="3306" #--database-name="${DB_NAME}" --admin-user-name="admin" #--admin-password="password" --site-name="${TYPO3_SITENAME}"

echo "Prepare filesytem"
/usr/local/bin/deployment_prepare_filesystem crawler devbox

echo "Run Installation"
/usr/local/bin/yad_crawler_typo3_devbox

echo "Secure filesystem"
/usr/local/bin/deployment_secure_filesystem crawler devbox

echo "--Done--!"
