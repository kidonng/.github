function tmpsh --wraps fish --description "Start fish with a temporary environment"
    env -i \
        HOME=(mktemp -d -t tmpsh) \
        PATH="$PATH" \
        # "everything in the world breaks if it's not xterm"
        # https://github.com/kovidgoyal/kitty/issues/2701#issuecomment-785620164
        TERM=xterm-256color \
        fish --init-command '
            # Prevent fish from generating completions
            mkdir -p $__fish_user_data_dir/generated_completions

            function _cleanup --on-event fish_exit
                echo Cleaning up (set_color --bold)$HOME(set_color normal)

                set --local cmd rm -r
                command --query trash && set cmd trash

                $cmd ~
            end

            cd
    ' $argv
end
