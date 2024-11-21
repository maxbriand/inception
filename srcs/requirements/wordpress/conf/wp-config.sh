sleep 10 

cd /var/www/wordpress

# if [ ! -f wp-config.php ]; then
wp core download --allow-root
wp config create --allow-root --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb:3306 --path='/var/www/wordpress'
wp core install --allow-root --url="mbriand.42.fr" --title="Hello" --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --path='/var/www/wordpress'
wp user create --allow-root $WP_LOGIN $WP_EMAIL --user_pass=$WP_USER_PWD --role=subscriber
chmod -R 775 wp-content
echo "wp-config.php done"
# else
#   echo "wp-config.php already exists."
# fi

php-fpm7.4 -F