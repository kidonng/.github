test -z "$XDG_DATA_HOME" && set --local XDG_DATA_HOME ~/.local/share

git clone --depth 1 https://github.com/savq/paq-nvim $XDG_DATA_HOME/nvim/site/pack/paqs/opt/paq-nvim
