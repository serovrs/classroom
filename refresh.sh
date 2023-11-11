#!/bin/bash

for i in `seq 24 35`; do ssh root@192.168.1.$i 'pkill -KILL -t tty1 && sleep 2s && userdel -rf user && sleep 3s && useradd -m -G uucp,proc,cdrom,floppy,cdwriter,audio,radio,scanner,xgrp,video,camera,vboxusers user && usermod -p "" user && reboot'; done
