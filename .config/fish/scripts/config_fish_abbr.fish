abbr cmd command
abbr com complete
abbr hd history delete
abbr pfn printf "%s\n"
abbr rp realpath

abbr ma string match
abbr re string replace

abbr rm trash
abbr sha sha256

abbr df df -h
abbr di diff
abbr tmp mktemp -d

abbr caf caffeinate
abbr ldd otool -L
abbr op open
abbr pc pbcopy
abbr pp pbpaste
abbr ql qlmanage -p
abbr stat stat -x
abbr xe 'xargs $EDITOR'

abbr dul diskutil list
abbr dum sudo diskutil mount
abbr duu diskutil unmount

abbr cat bat -p
abbr co code
abbr du dust
abbr http bat -l http
abbr vi nvim

abbr cl curl -L
abbr dl curl -LROJ

abbr la exa -la
abbr ll exa -l
abbr ls exa

abbr dot "git --git-dir ~/.config/dotfiles"
abbr ga git add
# Adapated from https://github.com/fish-shell/fish-shell/blob/9f4255ed76683d6772f354c1fb818a1655e877a0/share/completions/git.fish#L582-L604
git config --global --get-regexp "alias\..*" | string replace alias. "" | while read --local alias command
    abbr g$alias git $command
end
