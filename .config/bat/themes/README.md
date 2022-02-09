# bat themes

[`TokyoNight-light.tmTheme`](TokyoNight-light.tmTheme) is based on [tokyonight.nvim](https://github.com/enkia/enki-theme/blob/0b629142733a27ba3a6a7d4eac04f81744bc714f/scheme/Enki-Tokyo-Night.tmTheme, using https://github.com/folke/tokyonight.nvim/tree/main/lua), created with following commands:

```fish
cp TokyoNight-{dark,light}.tmTheme

for color in (rg --only-matching '#\w{6}' TokyoNight-light.tmTheme | sort -u)
    set inverted (lua -e "print(require 'tokyonight.util'.invertColor '$color')")
    sed -i '' s/$color/$inverted/g TokyoNight-light.tmTheme 
end
```
