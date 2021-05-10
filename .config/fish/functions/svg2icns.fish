function svg2icns -a svg
    if ! command -sq rsvg-convert
        echo svg2icns: librsvg is not available >&2
        return 1
    end

    set iconset (string replace .svg .iconset $svg)
    mkdir $iconset

    for size in 16 32 128 256 512
	set icon icon_$size"x"$size
        set 2x (math "2*$size")
	rsvg-convert -w $size $svg > $iconset/$icon.png
	rsvg-convert -w $2x $svg > $iconset/$icon@2x.png
    end

    iconutil --convert icns $iconset
    rm -r $iconset
end
