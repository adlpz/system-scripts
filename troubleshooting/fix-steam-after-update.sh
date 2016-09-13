#!/bin/bash
echo "Deleting random leftover libraries in .local/share"
find ~/.local/share/Steam/ -type f -iname "*libstdc*" -print -delete 
find ~/.local/share/Steam/ -type f -iname "*libgcc*" -print -delete
find ~/.local/share/Steam/ -type f -iname "*libxcb*" -print -delete
echo "Deleting some other random thing"
find ~/.steam/root/ -name "libgpg-error.so*" -print -delete
