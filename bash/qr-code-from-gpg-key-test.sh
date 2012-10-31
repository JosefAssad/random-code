#!/bin/sh

# Copyright 2012 Josef Assad
# The purpose of this script is to empirically demonstrate
# the space limitations of QR codes encoded with 
# the qrencode tool (http://fukuchi.org/works/qrencode/manual/index.html).

ALLOWED_CHARS="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789+/="
LEN_ALLOWED_CHARS=$(echo $ALLOWED_CHARS | wc -c)

for i in $(seq 1 10000)
do
KEY=""
    for j in $(seq 1 $i)
    do
	IDX=$(($RANDOM % $LEN_ALLOWED_CHARS))
	KEY=$KEY${ALLOWED_CHARS:$IDX:1}
    done
    RESULT=$(echo $KEY | qrencode -o output.png)
    STATUS="Trying with a string length of "$i":"
    if [ $RESULT -e 0 ]; then
	STATUS=$STATUS" SUCCESS"
    else
	STATUS=$STATUS" FAIL"
    fi
    echo $STATUS
done
