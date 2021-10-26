# https://github.com/fish-shell/fish-shell/issues/4570
function _complete
    if ! commandline -P
        set -l token (commandline -t)

        if string match -q -- "\~*" $token
            commandline -rt (string replace \\ "" $token)
            return
        end
    end

    commandline -f complete
end
