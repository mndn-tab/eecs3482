#!/bin/sh

exec &>/mnt/stage2.txt
set -v

# 4.1
check-selinux-installation
# 4.2
sestatus
# 4.3
pwd
# 4.4
cd /root
pwd
# 4.5
ls -l
# 4.6
ls -Z
# 5
cat /etc/selinux/config
# 5.1
awk -F= '$1 == "SELINUX" {print $2}' /etc/selinux/config
# 5.2
awk -F= '$1 == "SELINUXTYPE" {print $2}' /etc/selinux/config
# 6
semanage -h
# 7
semanage boolean
# 8
semanage boolean -l
# 8.1
semanage boolean -l | grep fenced_can_ssh
# 8.2
semanage boolean -l | grep user_ping
# 8.3
getsebool user_ping
getsebool fenced_can_ssh
# 9
getsebool httpd_can_network_connect_db
# 10
setsebool httpd_can_network_connect_db on
# 11
getsebool httpd_can_network_connect_db
# 12
setsebool -P httpd_can_network_connect_db on
# 13
ps axZ | grep httpd
# 14
seinfo -r
# 15
apache2ctl start
# 16
systemctl status apache2
# 17
ps axZ | grep httpd
