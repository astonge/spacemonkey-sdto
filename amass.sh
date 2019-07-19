#!/usr/bin/env bash

touch $1-amass
touch $1-subfinder

echo "[*] Finding Subdomains for $1"
echo "... subfinder"
~/go/bin/subfinder -t 10 -silent -o $1-subfinder -d $1 1&>/dev/null
echo "... amass (active)"
/snap/bin/amass enum -active -d $1 -o $1-amass 1&>/dev/null
echo "... amass (brute)"
/snap/bin/amass enum -src -brute -min-for-recursive 1 -o $1-amass-brute -d $1 1&>/dev/null
echo "[*] Subdomain enum Done"

echo "[*] Splicing & Sorting Domains"
cat $1-amass >> $1-subfinder
cat $1-amass-brute >> $1-subfinder

cat $1-subfinder|sort|uniq | sed -E 's/\[.*\]//g' |awk '{$1=$1};1' > $1-domains.txt
num=$(cat $1-domains.txt|wc -l)
echo "[*] $num domains. Done"
