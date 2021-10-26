set -Ux EDITOR code -w
set -Ux FZF_DEFAULT_OPTS --cycle --reverse --preview-window wrap --prompt '"❯ "' --marker ✔

set -Ux LESS -R -i -M --incsearch
set -Ux LESS_TERMCAP_md (set_color -o)(set_color blue)
set -Ux LESS_TERMCAP_us (set_color -u)(set_color green)
set -Ux LESS_TERMCAP_ue (set_color normal)

# Usage: https://github.com/fish-shell/fish-shell/pull/4940
# qmark-noglob: never used it and doesn't seem to break anything
set -U fish_features qmark-noglob
set -U fish_greeting

set -U fzf_preview_file_cmd preview
set -U fzf_preview_dir_cmd exa --color always -T -L 3
