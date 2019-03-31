#!/bin/sh

exec &>/mnt/stage3.txt
set -v

# 0.
sed -i 's/\/var\/www\/\html/\/html/g' \
    /etc/apache2/sites-available/000-default.conf 
systemctl reload apache2
# 1. 
mkdir /html
# 2
touch /html/index.html
# 3
ls -Z /html/index.html
# 4
ls -Zd /html
# 5
curl -s localhost | html2markdown
# 6
chcon -v --type=httpd_sys_content_t /html
# 7
chcon -v --type=httpd_sys_content_t /html/index.html
# 7a
ls -Z /html/index.html
# 7b
ls -Zd /html
curl -s localhost | html2markdown
#8 
touch /.autorelabel

