command -sq timg || exit

function timg
    set -l img (string match -r -- '\.(?:gif|jpe?g|png|svg|tiff|webp)$' $argv)
    set -l count (count $img)
    test $count -gt 1 && set -p argv -F --grid $count

    command timg $argv
end
