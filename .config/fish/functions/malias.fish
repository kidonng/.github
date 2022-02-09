command -sq osascript || exit

# https://stackoverflow.com/a/34558042
function malias -a source link -d "Create macOS alias"
    osascript -e 'tell app "Finder" to make new alias file to POSIX file "'(realpath $source)'" at POSIX file "'(realpath $link)'"'
end
