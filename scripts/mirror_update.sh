#!/bin/bash

#This will run reflector on mirrorlist, copying from backup first, overwriting

curl -o /etc/pacman.d/mirrorlist.backup https://www.archlinux.org/mirrorlist/all/
cp /etc/pacman.d/mirrorlist.backup /etc/pacman.d/mirrorlist
reflector --verbose -l 200 -p http --sort rate --save /etc/pacman.d/mirrorlist
