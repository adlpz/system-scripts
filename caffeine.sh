#!/bin/bash

CURRENT="$(xset q | grep Standby | cut -d' ' -f4)"


function change {
    xset dpms $1 $1 $1
}

# 60 300 600 3600 7200
function next {
    case $CURRENT in
        60)
            change 300
            ;;
        300)
            change 600
            ;;
        600)
            change 3600
            ;;
        3600)
            change 7200
            ;;
        7200)
            change 60
            ;;
        *)
            change 300
            ;;
    esac
}

case $1 in
    next)
        next
        ;;
    current)
        echo $CURRENT
        ;;
    *)
        echo "USAGE: $0 (next|current)"
        ;;
esac


