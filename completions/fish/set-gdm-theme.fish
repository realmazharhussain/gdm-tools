set -l all_subcmds -l list -s set -r reset -b backup -x extract -h --help help -m manual -e examples
set -l themelist (set-gdm-theme list)
set -l backup_actions -u -r update restore

complete -x -c set-gdm-theme -n "__fish_seen_subcommand_from set -s; and not __fish_seen_subcommand_from $themelist -b --background" -a "$themelist" -r -d "GDM Theme"
complete -x -c set-gdm-theme -n "__fish_seen_subcommand_from set -s; and not __fish_seen_subcommand_from $themelist -b --background" -a "-b --background" -r -d "Change background only"
#complete -c set-gdm-theme -n "__fish_seen_subcommand_from $themelist -b --background" -e -a "$themelist"
complete -F -c set-gdm-theme -n "__fish_seen_subcommand_from set -s; and __fish_seen_subcommand_from $themelist -b --background" -a "none" -d "No background"
complete -x -c set-gdm-theme -n "__fish_seen_subcommand_from backup -b; and not __fish_seen_subcommand_from $backup_actions -s set" -a 'update' -d "Update Backup"
complete -x -c set-gdm-theme -n "__fish_seen_subcommand_from backup -b; and not __fish_seen_subcommand_from $backup_actions -s set" -s u -d "Update Backup"
complete -x -c set-gdm-theme -n "__fish_seen_subcommand_from backup -b; and not __fish_seen_subcommand_from $backup_actions -s set" -a "restore" -d "Restore Backup"
complete -x -c set-gdm-theme -n "__fish_seen_subcommand_from backup -b; and not __fish_seen_subcommand_from $backup_actions -s set" -s r -d "Restore Backup"

complete -f -c set-gdm-theme -n "not __fish_seen_subcommand_from $all_subcmds" -a "list" -d "List GDM themes"
complete -f -c set-gdm-theme -n "not __fish_seen_subcommand_from $all_subcmds" -s l -d "List GDM themes"
complete -x -c set-gdm-theme -n "not __fish_seen_subcommand_from $all_subcmds" -a "set" -d "Set GDM theme/background"
complete -x -c set-gdm-theme -n "not __fish_seen_subcommand_from $all_subcmds" -s s -d "Set GDM theme/background"
complete -x -c set-gdm-theme -n "not __fish_seen_subcommand_from $all_subcmds" -a "backup" -d "Manage Backup"
complete -x -c set-gdm-theme -n "not __fish_seen_subcommand_from $all_subcmds" -s b -d "Manage Backup"
complete -f -c set-gdm-theme -n "not __fish_seen_subcommand_from $all_subcmds" -a "help" -d "Display Help"
complete -f -c set-gdm-theme -n "not __fish_seen_subcommand_from $all_subcmds" -s h -l help -d "Display Help"
complete -f -c set-gdm-theme -n "not __fish_seen_subcommand_from $all_subcmds" -a "manual" -d "Show Manual"
complete -f -c set-gdm-theme -n "not __fish_seen_subcommand_from $all_subcmds" -s m -d "Show Manual"
complete -f -c set-gdm-theme -n "not __fish_seen_subcommand_from $all_subcmds" -a "examples" -d "Show command examples"
complete -f -c set-gdm-theme -n "not __fish_seen_subcommand_from $all_subcmds" -s e -d "Show command examples"
complete -c set-gdm-theme -n "not __fish_seen_subcommand_from $all_subcmds" -a "extract" -d "Extract default theme"
complete -c set-gdm-theme -n "not __fish_seen_subcommand_from $all_subcmds" -s e -d "Extract default theme"

