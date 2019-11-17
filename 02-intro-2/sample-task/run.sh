#! /bin/bash

PROGRAM="$1"

count=0
for i in *.dat
do
    j=${i/.dat/.res}
    if "$PROGRAM" < "$i" > "$j"
    then
        echo Test $i
        if diff "${i/.dat/.ans}" "$j"
        then
            ((count++))
        else
            exit 1
        fi
    else
        echo "test crashed " "$i"
        exit 1
    fi
done
echo $count
