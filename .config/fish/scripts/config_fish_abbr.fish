abbr ap argparse
abbr cmd command
abbr cmdl commandline
abbr com complete
abbr con continue
abbr ct count
abbr fun function
abbr hd history delete
abbr pf printf
abbr pfn printf "%s\n"
abbr ret return
abbr rp realpath
abbr sc set_color

abbr join string join
abbr mat string match
abbr rep string replace
abbr split string split
abbr trim string trim

abbr base basename
abbr dir dirname
abbr nop ALL_PROXY= HTTPS_PROXY=
abbr psa ps aux
abbr rm trash -F
abbr sha sha256

abbr df df -h
abbr di diff
abbr mk mkdir -p
abbr tmp mktemp -d
abbr to touch

abbr caf caffeinate
abbr ldd otool -L
abbr op open
abbr pc pbcopy
abbr pp pbpaste
abbr ql qlmanage -p
abbr stat stat -x

abbr dul diskutil list
abbr dum sudo diskutil mount
abbr duu diskutil unmount

abbr cat bat -p
abbr du dust
abbr co code
abbr gl glow -p
abbr vi nvim

abbr cl curl -sSL
abbr dl curl -LORC - --retry 5

abbr la exa -la
abbr ll exa -l
abbr ls exa

abbr dot "git --git-dir ~/.config/dotfiles"
abbr ga git add
# Adapated from https://github.com/fish-shell/fish-shell/blob/9f4255ed76683d6772f354c1fb818a1655e877a0/share/completions/git.fish#L582-L604
git config --global --get-regexp "alias\..*" | string replace alias. "" | while read -l alias command
    abbr g$alias git $command
end
