complete z -f -a "(__fish_complete_directories (commandline -t) '')"
complete z -n "test -n (commandline -t)" -a "(printf '%s/\n' (zoxide query -l -- (commandline -t) | string replace $HOME '~'))" -d zoxide -k
