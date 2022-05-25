for weight in Bold BoldItalic ExtraBold ExtraBoldItalic ExtraLight ExtraLightItalic Italic Light LightItalic Medium MediumItalic Regular SemiBold SemiBoldItalic Thin ThinItalic
    set -l name "JetBrains Mono "(string replace -r "(.)Italic" '$1 Italic' $weight)" Nerd Font Complete.ttf"

    curl -R -C - --retry 5 -o $name "https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/JetBrainsMono/Ligatures/$weight/complete/"(string replace -a " " %20 $name)
end
