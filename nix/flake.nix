# CLI tools for both machines (Arch and macOS), installed as one Nix profile
# entry:
#
#   nix profile add ~/dotfiles              # first time
#   nix flake update --flake ~/dotfiles     # bump nixpkgs (flake.lock)
#   nix profile upgrade dotfiles            # apply edits / updates
#
# Adding or removing a package here and upgrading is the whole workflow;
# `nix profile rollback` undoes the last change.
#
# Left to Homebrew/pacman on purpose: GUI apps and anything other config
# points at by path (gnupg, pinentry-mac, gopass for the browser bridge,
# macOS GNU userland, gfold, zsh-syntax-highlighting).
{
  description = "Nameer's CLI packages, same on Arch and macOS";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = { self, nixpkgs }:
    let
      systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system:
        # terraform is BSL-licensed, which nixpkgs counts as unfree
        f (import nixpkgs { inherit system; config.allowUnfree = true; }));
    in
    {
      packages = forAllSystems (pkgs: {
        default = pkgs.buildEnv {
          name = "dotfiles";
          # Packages nixpkgs doesn't build for this OS (e.g. Linux-only ones
          # on the Mac) are skipped instead of failing the whole profile
          paths = pkgs.lib.filter (pkgs.lib.meta.availableOn pkgs.stdenv.hostPlatform) (with pkgs; [
            # Terminal & shell
            tmux
            neovim
            eza
            fzf
            ripgrep
            fd
            lf
            chafa # lf image previews where ueberzug can't draw (macOS, Wayland)
            poppler-utils # pdftoppm: lf pdf previews
            imagemagick # snacks.nvim image previews in nvim
            ghostscript # snacks.nvim pdf previews in nvim
            tree-sitter # CLI nvim-treesitter needs to build parsers
            highlight
            jq
            tree
            wget
            btop
            htop
            universal-ctags
            stylua

            # Files & shell
            bat
            dust
            procs
            bottom
            tokei
            onefetch
            trash-cli
            _7zz # 7-Zip
            zip
            unzip
            unrar
            atool
            rsync
            aria2
            parallel
            moor
            superfile
            vifm
            git-graph
            w3m
            termdown
            pwgen
            yt-dlp

            # Language servers/formatters nvim uses from PATH (Mason would
            # need npm/cargo to build these)
            pyright
            nil
            nixfmt
            statix
            omnisharp-roslyn # C#
            netcoredbg
            csharpier
            vtsls # TypeScript

            # Build tools for nvim plugins: silicon.nvim (cargo),
            # markdown-preview.nvim (yarn), rest.nvim via luarocks (Lua 5.1)
            cargo
            rustc
            nodejs
            yarn
            lua5_1
            lua51Packages.luarocks
            glow # glow.nvim

            # Dev
            git
            lazygit
            gh
            asdf-vm
            kubectl
            terraform
            awscli2
            azure-cli
            google-cloud-sdk
            go
            cmake
            meson
            uv
            poetry
            python3Packages.jupytext # jupytext.nvim: open .ipynb as text
            pandoc
            mermaid-cli
            prettier
            lua-language-server
            rust-analyzer
            haskellPackages.cabal-fmt
            stack
            kotlin
            maven
            jdk17
            ansible
            nmap
            siege
            codex
            cabal-install
            scala-cli
            dotnet-sdk_10
            aws-sam-cli
            maestro # mobile UI tests

            # Was AUR on Arch
            abook
            nchat
            fastfetch # neofetch is dead upstream
            haskellPackages.patat
            pistol
            imgcat
            netcat-gnu
            tagutil # Linux only
            wkhtmltopdf # Linux only
            dragon-drop # Linux only
          ]);
        };
      });
    };
}
