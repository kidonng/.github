command --query rsvg-convert || exit

function svg2icns --argument-names svg --description "Convert SVG to ICNS"
    set --local iconset (string replace .svg .iconset $svg)
    mkdir -p $iconset

    for size in 16 32 128 256 512
        set --local icon icon_$size"x"$size
        set --local 2x (math "2*$size")
        rsvg-convert -w $size $svg >$iconset/$icon.png
        rsvg-convert -w $2x $svg >$iconset/$icon@2x.png
    end

    iconutil --convert icns $iconset
    rm -r $iconset
end
