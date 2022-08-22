set --local dir ~/.vim/autoload

if test "$EDITOR" = nvim
    test -z "$XDG_DATA_HOME" && set --local XDG_DATA_HOME ~/.local/share
    set dir $XDG_DATA_HOME/nvim/site
end

curl -fsSL https://github.com/junegunn/vim-plug/raw/master/plug.vim --create-dirs -o $dir/autoload/plug.vim
