command --query osascript || exit

# https://stackoverflow.com/a/34558042
function malias --argument-names source link --description "Create macOS alias"
    osascript -e 'tell app "Finder" to make new alias file to POSIX file "'(realpath $source)'" at POSIX file "'(realpath $link)'"'
end
