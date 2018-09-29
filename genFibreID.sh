#!/bin/bash

USERNAME=$1
AUTHSTRING=00:00:00:00:00:00:00:00:00:00:00:66:74:69:2f

for (( i=0; i<${#USERNAME}; i++ )); do
        HEXCHAR=$(echo -n ${USERNAME:$i:1} | od -An -txC | xargs)
        AUTHSTRING=${AUTHSTRING}:${HEXCHAR}
done
echo ${AUTHSTRING}
