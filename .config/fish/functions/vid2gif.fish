if ! command --query ffmpeg || ! command --query gifski
    exit
end

function vid2gif --wraps gifski --description "Convert video to GIF"
    set --local vid $argv[-1]
    set --local tmp (mktemp -d -t vid2gif)

    ffmpeg -loglevel warning -i $vid $tmp/%04d.png
    gifski $argv[..-2] -o (path change-extension gif $vid) $tmp/*

    rm -r $tmp
end
