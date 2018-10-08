#!/usr/bin/env bash
touch $1-scan
subjack -v -a -w $1-domains.txt -ssl -a -o $1-scan
cat $1-scan|grep -v "Not Vuln"
