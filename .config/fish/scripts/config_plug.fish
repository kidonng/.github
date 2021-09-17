# Use latest Fish completions and functions with plug.fish
# DO NOT USE `plug enable` because it sources EVERYTHING
# Instead run `set -a plug_enabled fish-shell/fish-shell`
test -z "$plug_path" && exit

set -l dir $plug_path/fish-shell/fish-shell
git clone https://github.com/fish-shell/fish-shell $dir
ln -s share/completions $dir/completions
ln -s share/functions $dir/functions
echo /completions\n/functions >>$dir/.git/info/exclude
