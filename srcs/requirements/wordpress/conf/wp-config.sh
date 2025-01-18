#!/bin/sh

sleep 10

cd /var/www/html

if [ ! -f wp-config.php ]; then
    echo "wp-config.php not found"
    wp.phar core download --allow-root
    wp.phar config create --allow-root --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb:3306 --path='/var/www/html'
    wp.phar core install --allow-root --url="mbriand.42.fr" --title="Hello" --admin_user="$WP_ADMIN_USER" --admin_password="$WP_ADMIN_PWD" --admin_email="$WP_ADMIN_EMAIL" --skip-email --path='/var/www/html'
    wp.phar user create --allow-root $WP_USER $WP_EMAIL --user_pass=$WP_USER_PWD --role=author

    wp.phar config set WP_DEBUG true --allow-root
    wp.phar config set WP_DEBUG_log true --allow-root
    wp.phar config set WP_DEBUG_DISPLAY false --allow-root

    sudo chown -R "www-data:www-data" "/var/www/html"
    sudo find /var/www/html -type d -exec chmod 777 {} \;
    sudo find /var/www/html -type f -exec chmod 777 {} \;
    sudo chmod -R 777 /var/www/html/wp-content

    echo "wp-config.php done"
else
    echo "wp-config.php found"
fi

cd /

php-fpm7.4 -F
