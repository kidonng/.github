if ! command -sq ffmpeg || ! command -sq gifski
    exit
end

function vid2gif -w gifski -d "Convert video to GIF"
    set -l vid $argv[-1]
    set -l tmp (mktemp -d)

    ffmpeg -loglevel warning -i $vid $tmp/%04d.png
    gifski $argv[..-2] -o (basename $vid).gif $tmp/*

    rm -r $tmp
end
