set --local dir ~/.vim

if test "$EDITOR" = nvim
    test -z "$XDG_CONFIG_HOME" && set --local XDG_CONFIG_HOME ~/.config
    set dir $XDG_CONFIG_HOME/nvim
end

git clone --depth 1 https://github.com/k-takata/minpac $dir/pack/minpac/opt/minpac
