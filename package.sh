#!/bin/bash

installation_dir=$(pwd)/inst
dest=$2

if [ -d "$installation_dir" ]; then
    rm -drf "$installation_dir"
fi

mkdir -p "$installation_dir"/DEBIAN
cp control "$installation_dir"/DEBIAN

mkdir -p "$installation_dir"/usr/share
cp -r makefile.d "$installation_dir"/usr/share/makefile.d

dpkg-deb --build "$installation_dir" $dest
rm -rf "$installation_dir"
