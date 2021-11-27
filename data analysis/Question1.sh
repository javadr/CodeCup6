#!/bin/bash
# https://quera.ir/contest/assignments/35055/problems/117398

FILE=travel_insurance/train.csv
OUT=output1.txt

# Part 1
# Number of Row
NumRow="$(tail -n+1 $FILE | wc -l)"
printf "%d " "$NumRow" > $OUT
NumRow=$((NumRow-1))

# Number of Columns
printf "%d\n" "$(($(head -n1 $FILE | tr -cd ','|wc -c)+1))" >> $OUT

# Part 2
# Average of Annual Incom
printf "%d\n" "$(tail -n+2 $FILE | cut -d, -f5 | paste -sd+|bc|xargs -I _ echo "_/$NumRow" | bc)" >> $OUT

# Part 3
# Number Customers travelled abroad
printf "%d\n" "$(tail -n+2  $FILE | cut -d, -f9|grep -c Yes)" >> $OUT

# Part 4
PRI="$(echo "$(tail -n+2 $FILE | cut -d, -f3|grep -ic Private)"/$NumRow*100 |bc -l)"
GOV="$(echo "$(tail -n+2 $FILE | cut -d, -f3|grep -ic Governm)"/$NumRow*100 |bc -l)"
if [ "${PRI/.*/}" -gt "${GOV/.*/}" ]; then
    printf "Private Sector/Self Employed %.2f\n" "$PRI" >> $OUT
else
    printf "Government Sector %.2f\n" "$GOV" >> $OUT
fi

# Part 5
#Chronic and Insurance
printf "%.2f" "$(tail -n+2 $FILE | cut -d, -f7,10|grep 1|grep -c Yes|xargs -I {} echo "{}/$NumRow*100" | bc -l)" >> $OUT