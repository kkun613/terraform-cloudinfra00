#! /bin/bash
mkdir /root/.ssh
echo -e 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCyB5msT4l4q5dHq9Fnwp05cobTg7HfAL+p411XepgmNiCVYBtkFw/zuWKnMHSxBH6mfmGV36rCAdNPlNUu9J7hYtbtQc5VcYhuJtzbJjUZd2F79XFS1Uhwx/CaeVR8X8WR+KFirwcjT3UtAMQZuFH4pBLEsdKQBfnwn/7j796n6BrCgzx1v6jEx1YlRu3xKvNtUYj2F/Krrd4vZ5qeoKEWScEW59tud4S9N+rVGjLtbmv4Ro2wfeCu3uGvI4hYeotqsTjdxUVfNmsJS6m4U4xybayq7DiWnI0H02/BKHUaF0ZSMHhh3f8z5CsmFUeFNTZPjquQMLcY8r4QzO+BCm6t' > /root/.ssh/authorized_keys
chmod 700 /root/.ssh
dnf install -y wget tar httpd php php-gd php-curl php-mysqlnd
wget https://ko.wordpress.org/wordpress-6.7.2-ko_KR.tar.gz
tar xvfz wordpress-6.7.2-ko_KR.tar.gz -C /root/
cp -ar /root/wordpress/* /var/www/html/
sed -i "s/DirectoryIndex index.html/DirectoryIndex index.php/g" /etc/httpd/conf/httpd.conf
cp /var/www/html/{wp-config-sample.php,wp-config.php}
sed -i "s/database_name_here/wordpress/g" /var/www/html/wp-config.php
sed -i "s/username_here/root1/g" /var/www/html/wp-config.php
sed -i "s/localhost/10.0.5.6/g" /var/www/html/wp-config.php
sed -i "s/password_here/It12345\!/g" /var/www/html/wp-config.php
echo -n 'PGh0bWw+PGJvZHk+PGgxPmhlYWx0aC10ZXN0cGFnZTwvaDE+PC9ib2R5PjwvaHRtbD4=' | base64 -d > /var/www/html/health.html
systemctl enable --now httpd