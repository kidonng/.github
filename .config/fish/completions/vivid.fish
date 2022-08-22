complete vivid --no-files

complete vivid -n __fish_use_subcommand -a generate -d "Generate a LS_COLORS expression"
complete vivid -n __fish_use_subcommand -a preview -d "Preview a given theme"
complete vivid -n "__fish_seen_subcommand_from generate preview" -a "(vivid themes)"

complete vivid -n __fish_use_subcommand -a themes -d "Prints list of available themes"
complete vivid -n __fish_use_subcommand -a help -d "Prints this message or the help of the given subcommand(s)"

complete vivid --exclusive -s m -l color-mode -d "Type of ANSI colors to be used [default: 24-bit]" -a "8-bit 24-bit"
complete vivid -s d -l database -d "Path to filetypes database (filetypes.yml)"
complete vivid -s h -l help -d "Prints help information"
complete vivid -s V -l version -d "Prints version information"
