{ pkgs, ... }:

let
  mkLink = name: source: pkgs.runCommandLocal name { } ''
    mkdir -p $out/bin
    ln -s "${source}" $out/bin/${name}
  '';
in
{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    (writeShellScriptBin "code" ''
      ELECTRON_RUN_AS_NODE=1 \
      "/Applications/Visual Studio Code.app/Contents/MacOS/Electron" \
      "/Applications/Visual Studio Code.app/Contents/Resources/app/out/cli.js" \
      "$@"
    '')
    (mkLink "iina" "/Applications/IINA.app/Contents/MacOS/iina-cli")
    (mkLink "kitty" "/Applications/kitty.app/Contents/MacOS/kitty")
    (mkLink "youtube-dl" "${yt-dlp}/bin/yt-dlp")
    bat
    delta
    dua
    exa
    fd
    fish
    fzf
    gallery-dl
    gh
    git
    glow
    grc
    less
    nixpkgs-fmt
    nodePackages.vercel
    p7zip
    ripgrep
    sd
    timg
    vivid
    yt-dlp
    zoxide
    # JavaScript #
    deno
    nodejs
    yarn
    # Rust #
    # cargo
    # rust-analyzer
    # rustc
    # rustfmt
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "kid";
  home.homeDirectory = "/Users/kid";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.11";
}
