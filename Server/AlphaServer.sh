#!/bin/bash

while true
do
(echo $(echo "nodeABC has "; if [ -e /root/nodeABC.log ]; then grep -o -i "failed\|accepted" /root/nodeABC.log | wc -l; else echo "0"; fi; echo "failed attempt(s)") 
echo $(echo "nodeXYZ has "; if [ -e /root/nodeXYZ.log ]; then grep -o -i "failed\|accepted" /root/nodeXYZ.log | wc -l; else echo "0"; fi; echo "failed attempt(s)") ) > /home/monitoring.log
sleep 1
done
