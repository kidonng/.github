test (uname) = Darwin || exit

# https://stackoverflow.com/a/34558042
function macos_alias --argument-names source link
    osascript -e 'tell app "Finder" to make new alias file to POSIX file "'(path resolve $source)'" at POSIX file "'(path resolve $link)'"'
end
