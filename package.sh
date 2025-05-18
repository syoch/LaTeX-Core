#!/bin/bash -e

installation_dir=$(pwd)/inst
version=$(echo $1 | sed -e 's/rc/./g' -e 's/^v//g')

if [ -d "$installation_dir" ]; then
    rm -drf "$installation_dir"
fi

echo "Building report-core version $version"

mkdir -p "$installation_dir"/DEBIAN
cat <<EOF > "$installation_dir"/DEBIAN/control
Package: report-core
Version: $version
Section: tools
Priority: optional
Architecture: all
Maintainer: syoch64@gmail.com
Description: Report Core
EOF

mkdir -p "$installation_dir"/usr/share
cp -r makefile.d "$installation_dir"/usr/share/makefile.d

dpkg-deb --build "$installation_dir" report-core-"$version".deb
rm -rf "$installation_dir"
