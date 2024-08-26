#!/bin/sh

# Attendre pour que les services se lancent correctement
sleep 10

# Définir le répertoire de travail
cd /var/www/html

# Afficher le contenu du répertoire pour le débogage
ls -la /var/www/html

echo "MYSQL_DATABASE=${MYSQL_DATABASE}"
echo "MYSQL_USER=${MYSQL_USER}"
echo "MYSQL_PASSWORD=${MYSQL_PASSWORD}"

# Vérifier si le fichier wp-config.php existe déjà
if [ ! -f wp-config.php ]; then
  echo "Creating WordPress configuration..."
  wp config create --allow-root \
    --dbname=$MYSQL_DATABASE \
    --dbuser=$MYSQL_USER \
    --dbpass=$MYSQL_PASSWORD \
    --dbhost=mariadb:3306 \
    --path='/var/www/html'
fi

# Installer WordPress si ce n'est pas déjà fait
if ! wp core is-installed --allow-root --path='/var/www/html'; then
  echo "Installing WordPress..."
  wp core install --allow-root \
    --url="https://smarty.42.fr" \
    --title="Inception" \
    --admin_user="superUser" \
    --admin_password="superUser" \
    --admin_email="admin@example.com" \
    --path='/var/www/html'
fi

# Lancer PHP-FPM
/usr/sbin/php-fpm7.4 -F
