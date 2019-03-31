#!/bin/sh
HOST=bandit.labs.overthewire.org
PASSWORD=bandit0
NUM=0
while read -r COMMAND; do
    USERNAME=bandit$NUM
    echo running $USERNAME: $COMMAND
    PASSWORD=$(sshpass -p $PASSWORD ssh -tp 2220 $USERNAME@$HOST $COMMAND < /dev/zero 2>/dev/zero)
    echo $PASSWORD
    NUM=$(expr $NUM + 1)
done << EOF
cat ./readme
cat ./-
cat ./spaces\ in\ this\ filename
cat ./inhere/.hidden
sh -c "file ./inhere/* | fgrep text | cut -d: -f1 | xargs cat"
sh -c 'find ./inhere -size 1033c \! -executable | xargs file | fgrep text | cut -d: -f1 | xargs cat'
sh -c 'find / -size 33c -user bandit7 -group bandit6 | xargs cat'
sh -c 'fgrep millionth data.txt | cut -f2'
sh -c 'sort data.txt | uniq -u'
sh -c "strings data.txt | grep -o '[a-zA-Z0-9]\{32\}'"
echo hello from level 10
EOF
