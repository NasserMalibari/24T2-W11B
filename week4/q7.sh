#!/bin/dash

if [ $# -ne 1 ]
then
    echo "Usage: ./q7.sh <zID>"
    exit 1
fi  


acc "$1" |
sed -n "/User classes/,/Misc classes/p" |
head -n '-1' | # get rid of last line |
cut -d':' -f2 | tr ',' '\n'  | # split into lines
grep -E  '[A-Z]{4}[0-9]{4}t[0-3]_Student' | # grab students courses
sed -E 's/.*([A-Z]{4}[0-9]{4}).*/\1/' # transform line into just course code


