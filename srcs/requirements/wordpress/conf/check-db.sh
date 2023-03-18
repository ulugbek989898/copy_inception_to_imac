#!/bin/sh

ping -w3 mariadb

wp core install --url=lshttps://127.0.0.1 --title="Inception" --admin_user=uisroilo --admin_password=eval --admin_email=uisroilo@42.fr
wp user create someone someone@42.fr --role=author --user_pass=secret

wp theme install hestia --activate --allow-root
wp plugin install wp-redis --activate
# role == administrator, editor, author, contributor
# docker exec -it redis redis-cli monitor

/usr/sbin/php-fpm8 -F
