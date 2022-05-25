function pbcopy
    perl -pe "chomp if eof" | command pbcopy $argv
end
