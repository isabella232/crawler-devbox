rm -rf -- t3rookies.local
composer create-project typo3/cms-base-distribution t3rookies.local --no-interaction
cd t3rookies.local/
composer require helhum/typo3-console
composer require typo3-ter/introduction
#cp web/typo3conf/ext/typo3_console/Scripts/typo3cms .
cp web/typo3conf/ext/bootstrap_package/Configuration/Apache/.htaccess web/
chmod +x typo3cms
./typo3cms install:setup --non-interactive --database-user-name="root" --database-user-password="root" --database-host-name="localhost" --database-port="3306" --database-name="t3rookies_dev" --admin-user-name="admin" --admin-password="password" --site-name="t3rookies 2016"
./typo3cms database:updateschema '*.*'
./typo3cms extension:install realurl
./typo3cms extension:activate bootstrap_package
./typo3cms extension:activate introduction

# done
# document root is my-test-typo3/web