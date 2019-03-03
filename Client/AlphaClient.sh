#!/bin/bash

apt-get install -y rsync
apt-get install -y sshpass
apt-get install -y inotify-tools

# Creating identifier for this client because for some reason docker-compose can't pass ENV variable
if [ -e servername.txt ]
then
    echo "ok"
else
    echo $(($(date +%s%N)/1000000)) > servername.txt
fi
TO_ADDRESS="/home/"
TO_ADDRESS="${TO_ADDRESS}`cat servername.txt`"
TO_ADDRESS="${TO_ADDRESS}.log"
echo $TO_ADDRESS

# Init file sync
sshpass -p "screencast" rsync -rvz -e 'ssh -o StrictHostKeyChecking=no -p 22' --progress /var/log/auth.log root@server:$TO_ADDRESS

# Periodically sync everytime file modified
while inotifywait -q -e modify /var/log/auth.log >/dev/null
do
    sshpass -p "screencast" rsync -rvz -e 'ssh -o StrictHostKeyChecking=no -p 22' --progress /var/log/auth.log root@server:$TO_ADDRESS
done
