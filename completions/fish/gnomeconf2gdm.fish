set -l all_subcmds -r reset -h help --help
complete -x -c gnomeconf2gdm -n "not __fish_seen_subcommand_from $all_subcmds" -a "-r reset" -r -d "Reset GDM Settings"
complete -x -c gnomeconf2gdm -n "not __fish_seen_subcommand_from $all_subcmds" -a "-h --help help" -r -d "Show Help Message"
