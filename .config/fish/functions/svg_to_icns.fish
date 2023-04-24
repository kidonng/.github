test (uname) = Darwin
and command --query rsvg-convert
or exit

function svg_to_icns --argument-names svg
    set --local iconset (path change-extension iconset $svg)
    mkdir -p $iconset

    for size in 16 32 128 256 512
        set --local icon icon_$size"x"$size
        set --local 2x (math "2 * $size")
        rsvg-convert --width $size $svg >$iconset/$icon.png
        rsvg-convert --width $2x $svg >$iconset/$icon@2x.png
    end

    iconutil --convert icns $iconset
    rm -r $iconset
end
