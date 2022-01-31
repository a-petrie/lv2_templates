#!/bin/bash

# requirements
#   - copy template into template folder
#   - change all instances of <<PlugName>> to $1
#   - also applies to directory names

# make sure we're in the dir where template is
cd ~/code/templates/lv2/

#1. copy across the necessary files
mkdir -p $1/build/ $1/src/
cp c.template $1/src/$1.c
cp ttl.template $1/src/$1.ttl
cp Makefile manifest.ttl $1/src

#2. find and replace all <<PlugName>>s with input arg
sed -i "s/<<PlugName>>/$1/g" $1/src/*

#3. after template is ready, mv to plugins dir
mv $1/ ~/code/audio/plugins/
cd ~/code/audio/plugins/$1/

