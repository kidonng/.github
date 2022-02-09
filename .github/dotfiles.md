# [`dotfiles.fish`](../.archive/.config/fish/functions/dotfiles.fish)

Simple Git wrapper (with completions) for managing dotfiles.

> Want something more powerful? Check out [yadm](https://github.com/TheLocehiliosan/yadm).

## Usage

Setup a dotfiles repository is as intuitive as a regular one.

1. Initialize the repository with `dotfiles init`. You can specify any `git init` options except for `--bare`, including a different directory: `dotfiles init --quiet ~/.dotfiles`.

   - If no directory is specified, the repository will be initialized in `$XDG_CONFIG_HOME/dotfiles`, or `~/.config/dotfiles`.
   - You can always get the repository location with `dotfiles rev-parse --git-dir`.

2. Start tracking dotfiles with `dotfiles add path/to/file`, commit with `dotfiles commit` and you got it 😉
3. To access the dotfiles in a new environment, just `dotfiles pull --set-upstream <remote>` and you are ready to go!

## Resolve conflicts / selective checkout

The trick is to use a temporary directory as worktree:

```fish
set -l tmp (mktemp -d)
dotfiles config core.worktree $tmp
dotfiles pull --set-upstream <remote>
rm -rf $tmp
dotfiles config core.worktree ~
# Now checkout/restore your files
dotfiles restore ~
```

## Move repository to a new location

1. Move the repository
2. `set -U dotfiles path/to/location`
