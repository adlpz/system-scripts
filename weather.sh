#!/bin/bash

if [[ -z "$1" ]]; then
    CITY="València,Spain"
else
    CITY="$1"
fi

curl http://wttr.in/$CITY

