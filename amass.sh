#!/usr/bin/env bash

touch $1-domains.txt
~/go/bin/amass -norecursive -noalts -d $1 | tee $1-domains.txt
