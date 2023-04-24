set --universal --export EDITOR nvim
set --universal --export FZF_DEFAULT_OPTS \
    --cycle \
    --reverse \
    --preview-window wrap \
    --prompt '"❯ "' \
    --pointer '" "' \
    --marker ✔ \
    --bind ctrl-a:select-all,ctrl-alt-a:deselect-all

set --universal --export HOMEBREW_BAT 1

set --universal --export LESS \
    --RAW-CONTROL-CHARS \
    # Smart case
    --ignore-case \
    --LONG-PROMPT \
    --incsearch
set --universal --export LESS_TERMCAP_md (set_color --bold blue)
set --universal --export LESS_TERMCAP_us (set_color --underline green)
set --universal --export LESS_TERMCAP_ue (set_color normal)

# set --universal --export ALL_PROXY http://127.0.0.1:7890
# set --universal --export HTTPS_PROXY $ALL_PROXY
# set --universal --export HTTP_PROXY $ALL_PROXY
# set --universal --export NO_PROXY localhost,127.0.0.1

# Usage: https://github.com/fish-shell/fish-shell/pull/4940
# qmark-noglob: never used it and doesn't seem to break anything
set --universal fish_features qmark-noglob
set --universal fish_greeting

set --universal fzf_preview_file_cmd preview
set --universal fzf_preview_dir_cmd exa --color always

command --query delta && set --local delta "| delta --features no-file-decoration"
set --universal fzf_git_log_opts --preview "git show --color=always {1} $delta"

set --universal __done_notify_sound 1
