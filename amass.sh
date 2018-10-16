#!/usr/bin/env bash

touch $1-amass
touch $1-subfinder
~/go/bin/subfinder -o $1-subfinder -d $1
~/go/bin/amass -norecursive -noalts -d $1 | tee $1-amass
echo "subdomain enum done.."
echo "splicing lists.."
cat $1-amass >> $1-subfinder
echo "sorting.."
cat $1-subfinder|sort|uniq > $1-domains.txt
echo "done."
