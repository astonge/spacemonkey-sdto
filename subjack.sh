#!/usr/bin/env bash
touch $1-scan
conf_file=$HOME/go/src/github.com/haccer/subjack/fingerprints.json
~/go/bin/subjack -c $conf_file -v -t 15 -m -w $1-domains.txt -ssl -a -o $1-scan
echo "Checking for Vulnerable subdomains.."
cat $1-scan|grep -v "Not Vuln"|tee $1-vuln
