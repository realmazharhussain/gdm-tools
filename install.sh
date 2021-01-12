#!/bin/bash
currentDir=$(realpath "$(dirname "$0")")
binDir="$root"/usr/local/bin
manDir="$root"/usr/local/man

if ! which glib-compile-resources gresource > /dev/null; then
  if which apt > /dev/null; then
    sudo apt install libglib2.0-dev
  else
    echo "This script needs GLib (developer edition) in order to work. But it was not found." > /dev/stderr
    echo "Its package name may be 'glib2', 'glib2-devel', 'libglib2.0-dev', or straight up 'glib', etc. depending on your distro."
    exit 1
  fi
fi

if [ $UID = '0' ]; then
  echo 'installing gdm-tools ...'
  mkdir -p "$binDir" "$manDir"/man1
  gzip -fk "$currentDir"/man1/*
  mv "$currentDir"/man1/*.gz "$manDir"/man1/
  chmod +x "$currentDir"/bin/*
  cp "$currentDir"/bin/* "$binDir"/
  echo done.
else
  sudo --preserve-env=root "$0"
fi
