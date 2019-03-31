#!/bin/sh -x
systemctl start auditd.service
cat /etc/audit/auditd.conf
cat /var/log/audit/audit.log
auditctl
auditctl -l
auditctl -a exit,always -F path=/etc/passwd -F perm=wa
auditctl -a exit,always -F path=/etc/passwd -F perm=wa
ausearch -f /etc/passwd
adduser xyz
ausearch -f /etc/passwd
ausearch -f /etc/passwd | grep -o 'syscall=\([0-9]*\)' | cut -d= -f2 | xargs -l ausyscall
dir /etc/passwd -l
chmod 640 /etc/passwd
dir /etc/passwd -l
ausearch -f /etc/passwd
ausearch -f /etc/passwd | grep -o 'comm=[^ ]*' | cut -d'"' -f2
ausearch -f /etc/passwd | aureport -f -i
ausearch -m LOGIN --start today -i

