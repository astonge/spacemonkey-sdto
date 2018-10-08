#!/usr/bin/env bash

touch $1-domains.txt
amass -d $1 | tee $1-domains.txt
