#! /bin/bash
setenforce 0
grubby --update-kernel=ALL --args selinux=0
dnf install -y wget tar httpd php php-gd php-curl php-mysqlnd
wget https://ko.wordpress.org/wordpress-6.7.2-ko_KR.tar.gz
tar xvfz wordpress-6.7.2-ko_KR.tar.gz -C /root/
cp -ar /root/wordpress/* /var/www/html/
sed -i "s/DirectoryIndex index.html/DirectoryIndex index.php/g" /etc/httpd/conf/httpd.conf
cp /var/www/html/{wp-config-sample.php,wp-config.php}
sed -i "s/database_name_here/wordpress/g" /var/www/html/wp-config.php
sed -i "s/username_here/ysjang/g" /var/www/html/wp-config.php
sed -i "s/localhost/10.0.5.4/g" /var/www/html/wp-config.php
sed -i "s/password_here/It12345\!/g" /var/www/html/wp-config.php
echo -n 'PGh0bWw+PGJvZHk+PGgxPmhlYWx0aC10ZXN0cGFnZS0xPC9oMT48L2JvZHk+PC9odG1sPg==' | base64 -d > /var/www/html/health.html
chown -R apache.apache /var/www/
systemctl enable --now httpd