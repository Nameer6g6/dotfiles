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
      systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin" ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system:
        # terraform is BSL-licensed, which nixpkgs counts as unfree
        f (import nixpkgs { inherit system; config.allowUnfree = true; }));
    in
    {
      packages = forAllSystems (pkgs: {
        default = pkgs.buildEnv {
          name = "dotfiles";
          paths = with pkgs; [
            # Terminal & shell
            tmux
            neovim
            eza
            fzf
            ripgrep
            fd
            lf
            highlight
            jq
            tree
            wget
            btop
            htop
            universal-ctags
            stylua

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
          ];
        };
      });
    };
}
