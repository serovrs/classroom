#!/bin/bash

for i in `seq 21 36`; do ssh root@192.168.0.$i 'apt-get update && apt-get autoclean && apt-get autoremove -y && reboot'; done
