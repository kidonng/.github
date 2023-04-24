test (uname) = Darwin || exit

function pbcopy
    perl -pe "chomp if eof" | command pbcopy $argv
end
