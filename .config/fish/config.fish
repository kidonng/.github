set --local editor nvim
command --query $editor && set --export EDITOR $editor

set --export LESS --ignore-case --incsearch --RAW-CONTROL-CHARS
set --export SYSTEMD_LESS -FSMK $LESS

if command --query nekoray
    set --local proxy http://127.0.0.1:2080
    # Chrome: https://man.archlinux.org/man/chromium.1#ENVIRONMENT
    # curl: https://everything.curl.dev/usingcurl/proxies/env
    # pnpm: https://pnpm.io/npmrc#https-proxy
    set --export all_proxy $proxy
    set --export https_proxy $proxy
end

# https://wiki.archlinux.org/title/SSH_keys#Start_ssh-agent_with_systemd_user
set --local ssh_socket $XDG_RUNTIME_DIR/ssh-agent.socket
test -e $ssh_socket && set --export SSH_AUTH_SOCK $ssh_socket

# https://wiki.archlinux.org/title/KDE_Wallet#Using_the_KDE_Wallet_to_store_ssh_key_passphrases
set --local ssh_askpass ksshaskpass
if command --query $ssh_askpass
    set --export SSH_ASKPASS $ssh_askpass
    set --export SSH_ASKPASS_REQUIRE prefer
end

if command --query pnpm
    set --export PNPM_HOME ~/.local/share/pnpm
    set --prepend PATH $PNPM_HOME
end

# https://fcitx-im.org/wiki/Using_Fcitx_5_on_Wayland#KDE_Plasma
command --query fcitx5 && set --export XMODIFIERS @im=fcitx

set --local desktop startplasma-wayland
# https://wiki.archlinux.org/title/Sway#Automatically_on_TTY_login
test -z "$WAYLAND_DISPLAY" && test "$XDG_VTNR" = 1 &&
    command --query $desktop && exec $desktop

status is-interactive || exit

set fish_greeting

abbr dot git --git-dir \~/.dotfiles
abbr p pacman

abbr c nvim -M
abbr e nvim
