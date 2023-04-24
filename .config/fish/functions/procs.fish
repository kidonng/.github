command --query procs || exit

function procs
    # Alaways use dark theme when using TokyoNight theme
    # Use light theme instead if using One Dark theme
    # https://github.com/dalance/procs/issues/148
    command procs --theme dark $argv
end
