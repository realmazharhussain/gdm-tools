#!/bin/bash
[ -z "$DESTDIR" ] && DESTDIR=/
[ -z "$PREFIX" ] && PREFIX="/usr/local"

currentDir="$(realpath "$(dirname "$0")")"
binDir="$(realpath -m "$DESTDIR"/"$PREFIX"/bin)"
manDir="$(realpath -m "$DESTDIR"/"$PREFIX"/man)"
fishComp="$(realpath -m "$DESTDIR"/"$PREFIX"/share/fish/vendor_completions.d)"
confDir="$(realpath -m "$DESTDIR"/etc/gdm-tools)"

helpMsg(){
  echo "Usage: ./uninstall.sh [OPTION]"
  echo ""
  echo "Options"
  echo "  -h, --help    Show this help message"
  echo "  -p, --purge   Also delete config files"
  echo ""
  echo "Environment Variables"
  echo "  DESTDIR       Target Root Directory"
  echo "  PREFIX        Install Prefix e.g. /usr, /usr/local or ~/.local"
}

case "$1" in
  -h|--help|h|help)
    helpMsg
    exit
  ;;
  -p|--purge)
    purge=true
  ;;
  '')
    echo -n
  ;;
  *)
    echo "Invalide option! Run './uninstall.sh -h' for help."
    exit 1
  ;;
esac

installedFiles=(
	"$binDir"/{{set-,}gdm-theme,gnomeconf2gdm}
	"$manDir"/man1/{set-,}gdm-theme.1.gz
	"$fishComp"/{{set-,}gdm-theme,gnomeconf2gdm}.fish
	)

configFiles=(
	"$confDir"/{set-,}gdm-theme
)

if [ -d "$DESTDIR"/"$PREFIX" ]; then
  if [ -w "$dir1ToCheck" ] && [ -w "$dir1ToCheck"/"$dir2ToCheck" ]; then
  rootNeeded=false
  fi

  if [ $UID = '0' ] || [ "$rootNeeded" = false ] ; then
    echo -e 'uninstalling gdm-tools ...\n'
    if [ "$purge" = true ]; then
      for file in "${installedFiles[@]}" "${configFiles[@]}"; do
        rm -v "$file" 2>/dev/null
      done
    else
      for file in "${installedFiles[@]}"; do
        rm -v "$file" 2>/dev/null
      done
    fi
    echo -e '\n'done.
  else
    sudo --preserve-env=DESTDIR,PREFIX "$0" "$@"
  fi
else
  echo "You requested to uninstall from '$(realpath -m "$DESTDIR"/"$PREFIX")'."
  echo "But that directory does not exist."
  echo "Check if DESTDIR and PREFIX environment variables are set properly."
fi
