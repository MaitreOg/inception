#!/bin/bash

# Démarrer MariaDB en arrière-plan (si nécessaire dans le contexte d'un conteneur)
mysqld_safe &

# Attendre que le service MariaDB soit prêt
sleep 10

# Créer la base de données si elle n'existe pas
mysql -u root -e "CREATE DATABASE IF NOT EXISTS \`${DB_DATABASE}\`;"

# Créer l'utilisateur et lui accorder des privilèges sur la base de données
mysql -u root -e "CREATE USER IF NOT EXISTS \`${DB_USER}\`@'localhost' IDENTIFIED BY '${DB_PASSWORD}';"
mysql -u root -e "GRANT ALL PRIVILEGES ON \`${DB_DATABASE}\`.* TO \`${DB_USER}\`@'%';"

# Modifier le mot de passe du root
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';"

# Rafraîchir les privilèges
mysql -u root -e "FLUSH PRIVILEGES;"

# Arrêter proprement MariaDB avant de démarrer le processus principal
mysqladmin -u root -p"${DB_ROOT_PASSWORD}" shutdown

# Lancer MariaDB en mode sécurisé
exec mysqld_safe

