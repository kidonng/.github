command -sq nix || exit

# Use `nix shell` after Nix 2.4
function nrun -d "nix run"
    set -l pkg $argv[1]
    set -l cmd $argv

    if set -l sep (contains -i -- -- $argv)
        set pkg $argv[..(math $sep - 1)]
        set cmd $argv[(math $sep + 1)..]
        test (count $cmd) = 0 && set cmd fish
    end

    nix run nixpkgs.$pkg -c $cmd
end
