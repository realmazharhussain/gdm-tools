#!/bin/bash
currentDir=$(realpath $(dirname $0))
binDir="$root"/usr/local/bin
manDir="$root"/usr/local/man
if [ $UID = '0' ]; then
  echo 'installing gdm-tools ...'
  mkdir -p "$binDir" "$manDir"/man1
  gzip -fk "$currentDir"/man1/*
  mv "$currentDir"/man1/*.gz "$manDir"/man1/
  chmod +x "$currentDir"/bin/*
  cp "$currentDir"/bin/* "$binDir"/
  echo done.
else
  sudo --preserve-env=root $0
fi
