complete z --no-files -a "(__fish_complete_directories (commandline --current-token) '')"
complete z \
    --condition "test -n (commandline --current-token)" \
    --arguments "
		(printf %s/\n (
			zoxide query --list -- (commandline --current-token) |
			string replace ~ '~'
		))
	" \
    --description zoxide \
    --keep-order
