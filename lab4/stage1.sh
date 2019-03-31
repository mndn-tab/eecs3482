#!/bin/sh

export DEBIAN_FRONTEND=noninteractive

exec &>/mnt/stage1.txt
set -v
# 3.2
apt-get -qy install selinux-basics selinux-policy-default auditd
# 3.3
selinux-activate
# 4
