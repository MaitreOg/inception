#!/bin/sh

sleep 10

cd /var/www/html/

if [ ! -f wp-config.php ]; then
  wp config create --allow-root \
    --dbname=$DB_DATABASE \
    --dbuser=$DB_USER \
    --dbpass=$DB_PASSWORD \
    --dbhost=mariadb:3306 \
    --path='/var/www/html'
fi

  wp core install --allow-root \
    --url="https://smarty.42.fr" \
    --title="Inception" \
    --admin_user="superUser" \
    --admin_password="superUser" \
    --admin_email="admin@example.com" \
    --path='/var/www/html'
fi

/usr/sbin/php-fpm7.4 -F