#!/usr/bin/sh

# exit if there are no command line args
if test "$#" -eq 0 # or not bigger than 3
then
    echo "Usage: seq.sh START <inc> <end>"
    exit 1
fi

end=$1
start=1
inc=1

if [ $# -eq 2 ]
then
    start=$1
    end=$2
elif [ $# -eq 3 ]
then
    start=$1
    inc=$2
    end=$3
fi

curr=$start

while [ $curr -le $end ]
do
    echo "$curr"
    curr=$((curr + inc))
done


