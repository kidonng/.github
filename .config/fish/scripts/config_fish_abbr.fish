abbr dot dotfiles
abbr ql quicklook
abbr rm trash
abbr sha sha256sum

abbr df df -h
abbr di diff
abbr du du -hs
abbr tmp mktemp -d

abbr caf caffeinate
abbr ipc ipconfig getpacket en0
abbr ldd otool -L
abbr op open
abbr pc pbcopy
abbr pp pbpaste
abbr stat stat -x

abbr lsd diskutil list
abbr mo sudo diskutil mount
abbr um diskutil unmount

abbr hm home-manager
abbr nch nix-channel
abbr ne nix-env
abbr ngc nix-collect-garbage
abbr nr nix run
abbr ns nix-shell

abbr cat bat -p
abbr co code
abbr gl glow -p

abbr cl curl -L
abbr dl curl -LOR -C - --retry 5
abbr gdl gallery-dl
abbr ydl yt-dlp
abbr ip4 curl -4 ip.sb
abbr ip6 curl -6 ip.sb

abbr la exa -la
abbr ls exa
abbr ll exa -l

# https://github.com/fish-shell/fish-shell/blob/9f4255ed76683d6772f354c1fb818a1655e877a0/share/completions/git.fish#L582-L604
git config --global --get-regexp "alias\..*" | string replace alias. "" | while read -l alias command
    abbr g$alias git $command
end

abbr ga git add
