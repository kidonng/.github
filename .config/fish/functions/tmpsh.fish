function tmpsh --wraps fish --description "Start fish with a temporary environment"
    env -i \
        HOME=(mktemp -d -t tmpsh) \
        PATH="$PATH" \
        SHLVL=$SHLVL \
        TERM=$TERM \
        TERMINFO=$TERMINFO \
        fish --init-command '
            function _tmpsh_cleanup --inherit-variable HOME --on-event fish_exit
                echo Cleaning up (set_color --bold)$HOME(set_color normal)

                set -l cmd rm -r
                command --query trash && set cmd trash

                $cmd $HOME
            end

            cd
    ' $argv
end
