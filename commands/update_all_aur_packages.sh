#!/bin/bash
PACKAGES=$(pacman -Qqm)
packer -S `packer --auronly --quickcheck "$@" $PACKAGES`
