set -l all_subcmds -l list -s set -r reset -b backup -x extract -h --help help -m manual -e examples

complete -x -c gdm-theme -n "__fish_seen_subcommand_from set -s" -a '(gdm-theme list)' -r -d "GDM Theme"
complete -x -c gdm-theme -n "__fish_seen_subcommand_from set -s" -s b -l background -r -d "Set background"
complete -x -c gdm-theme -n "__fish_seen_subcommand_from backup -b" -a 'update' -d "Update Backup"
complete -x -c gdm-theme -n "__fish_seen_subcommand_from backup -b" -s u -d "Update Backup"
complete -x -c gdm-theme -n "__fish_seen_subcommand_from backup -b" -a "restore" -d "Restore Backup"
complete -x -c gdm-theme -n "__fish_seen_subcommand_from backup -b" -s r -d "Restore Backup"

complete -f -c gdm-theme -n "not __fish_seen_subcommand_from $all_subcmds" -a "list" -d "List GDM themes"
complete -f -c gdm-theme -n "not __fish_seen_subcommand_from $all_subcmds" -s l -d "List GDM themes"
complete -x -c gdm-theme -n "not __fish_seen_subcommand_from $all_subcmds" -a "set" -d "Set GDM theme/background"
complete -x -c gdm-theme -n "not __fish_seen_subcommand_from $all_subcmds" -s s -d "Set GDM theme/background"
complete -x -c gdm-theme -n "not __fish_seen_subcommand_from $all_subcmds" -a "backup" -d "Manage Backup"
complete -x -c gdm-theme -n "not __fish_seen_subcommand_from $all_subcmds" -s b -d "Manage Backup"
complete -f -c gdm-theme -n "not __fish_seen_subcommand_from $all_subcmds" -a "help" -d "Display Help"
complete -f -c gdm-theme -n "not __fish_seen_subcommand_from $all_subcmds" -s h -l help -d "Display Help"
complete -f -c gdm-theme -n "not __fish_seen_subcommand_from $all_subcmds" -a "manual" -d "Show Manual"
complete -f -c gdm-theme -n "not __fish_seen_subcommand_from $all_subcmds" -s m -d "Show Manual"
complete -f -c gdm-theme -n "not __fish_seen_subcommand_from $all_subcmds" -a "examples" -d "Show command examples"
complete -f -c gdm-theme -n "not __fish_seen_subcommand_from $all_subcmds" -s e -d "Show command examples"
complete -c gdm-theme -n "not __fish_seen_subcommand_from $all_subcmds" -a "extract" -d "Extract default theme"
complete -c gdm-theme -n "not __fish_seen_subcommand_from $all_subcmds" -s e -d "Extract default theme"

