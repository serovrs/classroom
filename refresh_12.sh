#!/bin/bash

for i in `seq 21 23`; do ssh root@192.168.1.$i 'pkill -KILL -t tty2 && sleep 5s && userdel -rf user && sleep 5s && useradd -m user && usermod -p "" user && reboot'; done
