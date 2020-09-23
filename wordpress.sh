#!/bin/bash

#Install PHP and HTTPD service
yum install php71-pdo php71-mcrypt php71-mbstring php71-mysqlnd php71-curl php71-intl php71-cli php71 httpd24-devel httpd24-tools httpd24 -y

#Make HTTPD to start on boot.
chkconfig httpd on

#Start HTTPD service
/etc/init.d/httpd start



#Install zip and unzip commands
yum install zip unzip -y
cd /var/www/html
wget https://wordpress.org/latest.zip
unzip latest.zip
mv wordpress/* .
rm -rf wordpress
chown ec2-user:apache /var/www/html -R
chmod 2775 /var/www/html -R
rm -f latest.zip
