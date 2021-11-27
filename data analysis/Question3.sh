#!/bin/bash
# https://quera.ir/contest/assignments/35055/problems/118272

FILE=supermarket.csv
OUT=output3.txt

# Part 1
printf "%d\n" "$(tail -n+2 $FILE | cut -d, -f3|sort -u |wc -l)" > $OUT

# Part 2
printf "%.2f\n" "$(echo "$(tail -n+2 $FILE | wc -l)/$(tail -n+2 $FILE | cut -d, -f2|sort -n|uniq -c|wc -l)" | bc -l )" >> $OUT

# Part 3
printf "%s\n" "$(tail -n+2 $FILE|cut -d, -f3|sort|uniq -c|sort -n|head -n4|awk '{$1=$1};1'|cut -d" " -f2-|paste -sd,)"  >> $OUT

# Part 4
printf "%s\n" "$(tail -n+2 $FILE|grep 2020-|sort|cut -d, -f1,2|uniq|cut -d, -f1|uniq -c|sort|tail -n5|awk '{$1=$1};1'|cut -d" " -f2|paste -sd,)" >> $OUT

# Part 5
printf "%s\n" "$(tail -n+2 $FILE|cut -d, -f2|xargs -I{} date -d"{} 01:00:00" '+%A'|sort|uniq -c|sort -n|tail -n1|awk '{$1=$1};1'|cut -d" " -f2)" >> $OUT