#!/bin/dash


# ./q6.sh |

mlalias 'cs2041.tue11-strings' | 
grep -E '^\s*z[0-9]{7}' | # grab zIDs 
sed -E 's/@.*//' | # remove email part
sed -E 's/^\s*//' | sort  | head -n '20' | # remove starting space
while read zid
do
    q7.sh $zid
    # echo "zid is $zid"
done |
sort | uniq -c | sort -nr