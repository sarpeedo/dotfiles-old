#!/bin/bash

# Dependencies:
# imagemagick
# i3lock-color-git
# scrot

IMAGE=~/.wallpapers/i3lock.png

BLURTYPE="0x5" # 7.52s
#BLURTYPE="0x2" # 4.39s
#BLURTYPE="5x3" # 3.80s
#BLURTYPE="2x8" # 2.90s
#BLURTYPE="2x3" # 2.92s

scrot $IMAGE
convert $IMAGE -blur $BLURTYPE -font Inconsolata -pointsize 50 -fill green -gravity center -annotate +0+150 'type to unlock' $IMAGE
composite -gravity center ~/.wallpapers/lock.png $IMAGE $IMAGE
#systemctl suspend
i3lock -i $IMAGE
rm $IMAGE
