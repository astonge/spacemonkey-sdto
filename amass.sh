#!/usr/bin/env bash

touch $1-amass
touch $1-subfinder

echo "[*] Finding Subdomains for $1"
~/go/bin/subfinder -t 10 -silent -o $1-subfinder -d $1 1&>/dev/null
#/snap/bin/amass -active -norecursive -noalts -d $1 -o $1-amass 1&>/dev/null
/snap/bin/amass enum -active -d $1 -o $1-amass 1&>/dev/null
echo "[*] Subdomain enum Done"

echo "[*] Splicing & Sorting Domains"
cat $1-amass >> $1-subfinder
cat $1-subfinder|sort|uniq > $1-domains.txt
num=$(cat $1-domains.txt|wc -l)
echo "[*] $num domains. Done"
