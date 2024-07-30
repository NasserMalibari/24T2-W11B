#!/usr/bin/dash

# check argument specified

if [ $# -ne 1 ] 
then
    echo "Usage: rmall.sh <dir>"
    exit 1
fi

if [ ! -d $1 ]
then
    echo "Usage: rmall.sh <dir>"
    exit 1
fi

dir=$1

# for file in dir/*

cd $dir || exit 1
# prog1 && prog2 &&
# prog1 || prog2 

for file in *
do
    if [ -f $file ]
    then
        echo "rm $file"
    fi
done

for file in *
do
    if [ -d $file ]
    then
        echo -n "Do you want to delete files in ${file}: [yes|y / n] "
        read response
        if test $response = "yes"
        then
            rmall.sh $file
        fi 
    fi
done


