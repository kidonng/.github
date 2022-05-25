set -Ux EDITOR nvim
set -Ux FZF_DEFAULT_OPTS --cycle --reverse --preview-window wrap --prompt '"❯ "' --pointer '" "' --marker ✔

set -Ux LESS -R -i -M --incsearch
set -Ux LESS_TERMCAP_md (set_color -o)(set_color blue)
set -Ux LESS_TERMCAP_us (set_color -u)(set_color green)
set -Ux LESS_TERMCAP_ue (set_color normal)

# set -Ux ALL_PROXY http://127.0.0.1:7890
# set -Ux HTTPS_PROXY $ALL_PROXY
set -Ux NO_PROXY localhost,127.0.0.1

# Usage: https://github.com/fish-shell/fish-shell/pull/4940
# qmark-noglob: never used it and doesn't seem to break anything
# ampersand-nobg-in-token: https://github.com/fish-shell/fish-shell/pull/7991
set -U fish_features qmark-noglob ampersand-nobg-in-token
set -U fish_greeting

set -U fzf_preview_file_cmd preview
set -U fzf_preview_dir_cmd exa --color always -T -L 3
set -U fzf_git_log_opts --preview "git show --color=always {1} | delta --features no-file-decoration"

set -U __done_notify_sound 1
