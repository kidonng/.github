complete z -f -a "(__fish_complete_directories (commandline -t) '')"
complete z -n "test -n (commandline -t)" -a "(zoxide query -l -- (commandline -t))" -k
