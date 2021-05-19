#!/bin/bash
[ -z "$DESTDIR" ] && DESTDIR=/
[ -z "$PREFIX" ] && PREFIX="/usr/local"

currentDir="$(realpath "$(dirname "$0")")"
binDir="$DESTDIR"/"$PREFIX"/bin
manDir="$DESTDIR"/"$PREFIX"/man
fishComp="$DESTDIR"/"$PREFIX"/share/fish/vendor_completions.d
confDir="$DESTDIR"/etc/gdm-tools

helpMsg(){
  echo "Usage: [VAR]=[val]... ./install.sh"
  echo "OR Usage: ./install.sh"
  echo "This script respects two Environment Variables; DESTDIR, PREFIX."
  echo -e "DESTDIR\t\tTarget Root Directory"
  echo -e "PREFIX\t\tInstall Prefix e.g. /usr or /usr/local"
}

case "$1" in
  -h|--help|h|help)
    helpMsg
    exit
  ;;
  '')
    echo -n
  ;;
  *)
    echo "Invalide option! Run './install.sh -h' for help."
    exit 1
  ;;
esac

depMsg() {
    echo "This script needs '$depName' in order to work. But it is not installed." > /dev/stderr
    echo "Please, install it first in order to install gdm-tools"
    echo "Its package name may be $pkgNames depending on your distro."
    exit 1
}

if ! which glib-compile-resources gresource &> /dev/null; then
  depName='GLib (developer edition)'
  pkgNames="'glib2', 'glib2-devel', 'libglib2.0-dev', or straight up 'glib', etc. "
  if which apt &> /dev/null; then
    sudo apt install libglib2.0-dev || depMsg
  elif which pacman &> /dev/null; then
    sudo pacman -S glib2 || depMsg
  else
    depMsg
  fi
fi

if ! which dconf &> /dev/null; then
  depName='DConf (CommandLine Version)'
  pkgNames="'dconf-cli', or 'dconf'"
  if which apt &> /dev/null; then
    sudo apt install dconf-cli || depMsg
  elif which pacman &> /dev/null; then
    sudo pacman -S dconf || depMsg
  else
    depMsg
  fi
fi

dir1ToCheck="$(realpath -m "$DESTDIR")"
dir2ToCheck="$(realpath -m "$PREFIX")"
if mkdir -p "$dir1ToCheck" "$dir1ToCheck"/"$dir2ToCheck" 2>/dev/null && [ -w "$dir1ToCheck" ] && [ -w "$dir1ToCheck"/"$dir2ToCheck" ]; then
  rootNeeded=false
fi

if [ $UID = '0' ] || [ "$rootNeeded" = false ] ; then
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
  sudo --preserve-env=DESTDIR,PREFIX "$0"
fi
