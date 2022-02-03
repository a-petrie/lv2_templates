#!/bin/bash

# determine whether or not to use C or C++
if [ "$2" = "-c" ]; then
  exstension="c"
  compiler=gcc
else
  exstension="cpp"
  compiler=g++
fi

targetDir=`pwd`/

# make sure we're in the dir where template is
cd ~/code/templates/lv2/

#1. copy across the necessary files
mkdir -p $1/build/ $1/src/
cp $exstension.template $1/src/$1.$exstension
cp ttl.template $1/src/$1.ttl
cp Makefile manifest.ttl $1/src

#2. find and replace all <<PlugName>>s with input arg
sed -i "s/<<PlugName>>/$1/g" $1/src/*
sed -i "s/<<Compiler>>/$compiler/g" $1/src/Makefile

#3. after template is ready, mv to plugins dir
mv $1/ $targetDir
cd $targetDir/$1/

