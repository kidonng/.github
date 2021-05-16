command -sq zoxide || exit

function z
	if ! set -q argv[1] || test "$argv" = - || test -d "$argv"
		cd $argv
	else
		set dir (zoxide query --exclude $PWD -- $argv) && cd $dir
	end
end
