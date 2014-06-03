#!/bin/bash

CONFIG_PATH="./config"

ARG=$1

if [ "$ARG" = "inittable" ]
then
    echo -n "password table: "
    read TABLE_NAME
    echo -n "password: "
    read TABLE_PW
    PW_HASH=$(mysql -upws -p -s -r -N -e "SELECT SHA2('$TABLE_PW', 512)")
    echo $PW_HASH > "$CONFIG_PATH/$TABLE_NAME.sha2"
else
   echo "Use 'help' for instructions on this command"
fi
