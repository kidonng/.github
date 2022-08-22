complete z --no-files -a "(__fish_complete_directories (commandline --current-token) '')"
complete z -n "test -n (commandline --current-token)" -a "(printf '%s/\n' (zoxide query --list -- (commandline --current-token) | string replace $HOME '~'))" -d zoxide --keep-order
