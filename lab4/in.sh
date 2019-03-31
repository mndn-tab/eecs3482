#!/bin/sh

sleep 1
while read COMMAND; do
    echo $COMMAND
    sleep 1
done << EOT
apt-get install selinux-basics selinux-policy-default auditd
selinux-activate
reboot
check-selinux-installation
sestatus
pwd
cd /root
pwd
ls -l
ls -Z
cat /etc/selinux/config


EOT
