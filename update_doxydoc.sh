#!/bin/bash

if [ $# == 1 ] ; then
    SOURCEDIR=$1
else
    SOURCEDIR='../machanguitos/build/html'
fi

rm -rf dev
mkdir dev

cp -r $SOURCEDIR/search dev/

cp $SOURCEDIR/*.html dev/
cp $SOURCEDIR/*.png dev/
cp $SOURCEDIR/*.svg dev/
cp $SOURCEDIR/*.css dev/
cp $SOURCEDIR/*.js dev/

git add dev/search/* dev/*.*