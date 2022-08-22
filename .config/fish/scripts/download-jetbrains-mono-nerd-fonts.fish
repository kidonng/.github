for weight in Bold BoldItalic ExtraBold ExtraBoldItalic ExtraLight ExtraLightItalic Italic Light LightItalic Medium MediumItalic Regular SemiBold SemiBoldItalic Thin ThinItalic
    set --local name "JetBrains Mono "(string replace --regex "(.)Italic" '$1 Italic' $weight)" Nerd Font Complete.ttf"

    curl -R -o $name "https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/JetBrainsMono/Ligatures/$weight/complete/"(string replace --all " " %20 $name)
end
