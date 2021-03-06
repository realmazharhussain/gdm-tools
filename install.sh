#!/bin/bash
currentDir="$(realpath "$(dirname "$0")")"
binDir="$root"/usr/local/bin
manDir="$root"/usr/local/man
fishComp="$root"/usr/local/share/fish/vendor_completions.d
confDir="$root"/etc/gdm-tools

depMsg() {
    echo "This script needs GLib (developer edition) in order to work. But it is not installed." > /dev/stderr
    echo "Please, install it first in order to install gdm-tools"
    echo "Its package name may be 'glib2', 'glib2-devel', 'libglib2.0-dev', or straight up 'glib', etc. depending on your distro."
    exit 1
}

if ! which glib-compile-resources gresource &> /dev/null; then
  if which apt &> /dev/null; then
    sudo apt install libglib2.0-dev || depMsg
  elif which pacman &> /dev/null; then
    sudo pacman -S glib2 || depMsg
  else
    depMsg
  fi
fi

if [ $UID = '0' ]; then
  echo 'installing gdm-tools ...'
  mkdir -p "$binDir" "$manDir"/man1 "$fishComp" "$confDir"
  gzip -fk "$currentDir"/man1/*
  mv "$currentDir"/man1/*.gz "$manDir"/man1/
  chmod +x "$currentDir"/bin/*
  cp "$currentDir"/bin/* "$binDir"/
  cp "$currentDir"/completions/fish/* "$fishComp"/
  cp -i "$currentDir"/config/* "$confDir"/
  echo done.
else
  sudo --preserve-env=root "$0"
fi
