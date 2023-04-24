test (uname) = Darwin || exit

# https://www.defaults-write.com/adding-quit-option-to-os-x-finder/
function toggle_finder_quit_menu
    set --local command com.apple.finder QuitMenuItem

    if defaults read $command &>/dev/null
        defaults delete $command
    else
        defaults write $command true
    end

    killall Finder
end
