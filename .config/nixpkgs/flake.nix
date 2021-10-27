{
  inputs = {
    nixpkgs.url = "nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager }: {
    homeConfigurations.kid = home-manager.lib.homeManagerConfiguration {
      system = "x86_64-darwin";
      homeDirectory = "/Users/kid";
      username = "kid";
      stateVersion = "21.11";
      configuration = { pkgs, ... }:
        let
          mkLink = name: source: pkgs.runCommandLocal name { } ''
            mkdir -p $out/bin
            ln -s "${source}" $out/bin/${name}
          '';
        in
        {
          programs.home-manager.enable = true;

          home.packages = with pkgs; with darwin; [
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
            gh
            git
            glow
            grc
            less
            nixpkgs-fmt
            nodePackages.vercel
            p7zip
            ripgrep
            timg
            trash
            vivid
            yt-dlp
            zoxide
            deno
            nodejs
            yarn
          ];
        };
    };
  };
}
