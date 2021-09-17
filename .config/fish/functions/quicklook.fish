test (uname) = Darwin || exit

function quicklook -d "macOS Quick Look"
    qlmanage -p $argv &>/dev/null
end
