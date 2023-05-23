#!/bin/bash
echo "The IP is: " $1

nmap -F $1/24 -oG nmapResult.txt

awk 'NR % 2 == 0 { print $3, $2 }' nmapResult.txt > devices.txt

sed -i 's/()/(Unknown)/g' devices.txt

rm nmapResult.txt
