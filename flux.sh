#!/bin/bash

EXECUTABLE="xflux"
ARGUMENTS="-l 39.48 -g 0.39"
function running {
    pgrep $EXECUTABLE >/dev/null
    if [ "$?" == "0" ]; then
        echo 1
    else
        echo 0
    fi
}

function start {
    status=$(running)
    if [ "$status" == "1" ]; then
        echo "Flux is already running"
        exit 1
    fi

    $EXECUTABLE $ARGUMENTS > /dev/null
}

function stop {
    killall -TERM $EXECUTABLE
}


function status {
status=$(running)
    if [ "$status" == "1" ]; then
        echo "Running"
    else
        echo "Stopped"
    fi
}



case $1 in
    start)
        start
        ;;
    stop)
        stop
        ;;
    status)
        status
        ;;
    *)
        echo "USAGE: $0 (start|stop|status)"
esac
