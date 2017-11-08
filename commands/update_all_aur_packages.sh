#!/bin/bash
PACKAGES=$(pacman -Qqm)
apacman --auronly --needed --warn -S "$@" $PACKAGES
