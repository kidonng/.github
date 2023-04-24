test (uname) = Darwin || exit

function toggle_icons --description "Toggle displaying of desktop icons"
    set --local command com.apple.finder CreateDesktop

    if defaults read $command &>/dev/null
        defaults delete $command
    else
        defaults write $command false
    end

    killall Finder
end
