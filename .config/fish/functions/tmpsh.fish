function tmpsh -w fish -d 'Start fish with a temporary $HOME'
    HOME=(mktemp -d) fish -C '
        function _tmpsh_cleanup -V HOME -e fish_exit
            echo Cleaning up (set_color -o)$HOME(set_color normal)
            command rm -rf $HOME
        end

        builtin cd $HOME
    ' $argv
end
