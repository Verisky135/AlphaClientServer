#!/bin/bash

TO_ADDRESS="/root/"
TO_ADDRESS="${TO_ADDRESS}`cat /home/servername.txt`"
TO_ADDRESS="${TO_ADDRESS}.log"
echo $TO_ADDRESS

# Init file sync
while sshpass -p "screencast" rsync -rvz -e 'ssh -o StrictHostKeyChecking=no -p 22' --progress /var/log/auth.log root@server:$TO_ADDRESS 2>&1 >/dev/null | grep -q 'error'
do 
    sleep 1
    echo Server is disconnected, resending log...
done

# Periodically sync everytime file modified
while inotifywait -q -e modify /var/log/auth.log >/dev/null
do
    while sshpass -p "screencast" rsync -rvz -e 'ssh -o StrictHostKeyChecking=no -p 22' --progress /var/log/auth.log root@server:$TO_ADDRESS 2>&1 >/dev/null | grep -q 'error'
    do 
        sleep 1
        echo Server is disconnected, resending log...
    done
done
