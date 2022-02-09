command -sq deno || exit

function deno
    # https://github.com/denoland/deno/issues/12080
    set -lx HTTPS_PROXY $ALL_PROXY
    command deno $argv
end
