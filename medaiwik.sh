#!/bin/bash
dnf install httpd php php-mysqlnd php-gd php-xml mariadb-server mariadb php-mbstring php-json -y
yum install git -y
yum install wget -y

systemctl start mariadb
systemctl start httpd


mkdir /apps
cd /apps

wget https://assessment88.s3.amazonaws.com/httpd.conf
wget https://assessment88.s3.amazonaws.com/db.sql

chmod 777 . -R

mysql -u root < db.sql

wget https://releases.wikimedia.org/mediawiki/1.34/mediawiki-1.34.2.tar.gz
wget https://releases.wikimedia.org/mediawiki/1.34/mediawiki-1.34.2.tar.gz.sig
gpg --verify mediawiki-1.34.2.tar.gz.sig mediawiki-1.34.2.tar.gz

cd /var/www
tar -zxf /apps/mediawiki-1.34.2.tar.gz
ln -s mediawiki-1.34.2/ mediawiki

sed -i 's/SELINUX=.*/SELINUX=disabled/' /etc/selinux/config
rm -rf /etc/httpd/conf/httpd.conf
cp -rnf /apps/httpd.conf /etc/httpd/conf

systemctl restart httpd

