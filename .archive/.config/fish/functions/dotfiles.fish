command -sq git || exit

test -z "$XDG_CONFIG_HOME" && set -l XDG_CONFIG_HOME ~/.config
test -z "$dotfiles" && set -l dotfiles $XDG_CONFIG_HOME/dotfiles
set -l command git --git-dir $dotfiles
functions -q __fish_git || source $__fish_data_dir/completions/git.fish

function dotfiles -w "$command" -V command -V dotfiles -d "Manage dotfiles"
    set -l non_opts (string match -v -- "-*" $argv)
    set -l cmd $non_opts[1]
    set -l alias __fish_git_alias_$cmd

    if test "$cmd" = init || test "$$alias" = init
        set -a argv --bare
        if test "$non_opts" = init
            set -a argv $dotfiles
        else
            set -U dotfiles (realpath $non_opts[2])
        end

        if git $argv
            $command config core.bare false
            $command config core.worktree ~
            $command config status.showUntrackedFiles no
        else
            return
        end
    else
        $command $argv
    end
end
