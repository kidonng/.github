test (uname) = Darwin || exit

# https://osxdaily.com/2015/05/05/reset-launchpad-layout-mac-os-x/
function reset_launchpad
    defaults write com.apple.dock ResetLaunchPad -bool true
    killall Dock
end
