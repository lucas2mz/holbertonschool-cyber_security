#!/bin/bash
inpt=${1#"{xor}"}

k=0x5F

decode=$(echo "$inpt" | base64 --decode | od -An -t u1)

for byte in $decode; do
    printf "\\$(printf '%03o' $((byte ^ k)))"
done

echo