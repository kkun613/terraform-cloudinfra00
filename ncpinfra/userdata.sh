#! /bin/bash
amazon-linux-extras enable php8.0
yum install -y wget tar httpd php php-cli php-pdo php-fpm php-mysqlnd
wget https://ko.wordpress.org/wordpress-6.7.2-ko_KR.tar.gz
tar xvfz wordpress-6.7.2-ko_KR.tar.gz -C /root/
cp -ar /root/wordpress/* /var/www/html/
sed -i "s/DirectoryIndex index.html/DirectoryIndex index.php/g" /etc/httpd/conf/httpd.conf
cp /var/www/html/{wp-config-sample.php,wp-config.php}
sed -i "s/database_name_here/wordpress/g" /var/www/html/wp-config.php
sed -i "s/username_here/root/g" /var/www/html/wp-config.php
sed -i "s/password_here/It12345\!/g" /var/www/html/wp-config.php
sed -i "s/localhost/ysjang-db.cbea064qaiyh.ap-northeast-2.rds.amazonaws.com/g" /var/www/html/wp-config.php
cat > /var/www/html/health.html <<eof
<html><body><h1>health-testpage</h1></body></html>
eof
systemctl enable --now httpd