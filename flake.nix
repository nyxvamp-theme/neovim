{
  description = "Nyxvamp Neovim Theme - Local Development Environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};

        nyxvampPlugin = pkgs.vimUtils.buildVimPlugin {
          pname = "nyxvamp-nvim";
          version = "0.1.0";
          src = pkgs.lib.cleanSourceWith {
            src = ./.;
            filter = path: type: let
              baseName = baseNameOf path;
              relativePath = pkgs.lib.removePrefix (toString ./. + "/") (toString path);
            in
              # Include essential plugin files
              pkgs.lib.hasSuffix ".lua" baseName
              || pkgs.lib.hasSuffix ".vim" baseName
              || pkgs.lib.hasSuffix ".scm" baseName  # treesitter query files
              || baseName == "README.md"
              || baseName == "LICENSE"
              || baseName == "LICENSE.md"
              || type == "directory"
              # Exclude development files
              && !(baseName == "flake.nix" 
                || baseName == "flake.lock"
                || baseName == ".envrc"
                || baseName == ".gitignore"
                || relativePath == "samples"
                || relativePath == "assets"
                || relativePath == "CLAUDE.md"
                || relativePath == "nvim");
          };
        };

        nyxvampNeovim = pkgs.neovim.override {
          configure = {
            customRC = ''
              syntax on
              filetype plugin indent on
              set number
              set relativenumber
              set termguicolors
              set background=dark
              colorscheme nyxvamp-veil
            '';

            packages.nyxvamp = {
              start = [
                nyxvampPlugin
                (pkgs.vimPlugins.nvim-treesitter.withPlugins (p:
                  with p; [
                    tree-sitter-lua
                    tree-sitter-elixir
                    tree-sitter-rust
                    tree-sitter-haskell
                    tree-sitter-clojure
                    tree-sitter-nix
                    tree-sitter-json
                    tree-sitter-markdown
                    tree-sitter-bash
                  ]))
              ];
            };
          };
        };
      in {
        # Development shell with theme development tools
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            stylua
            lua-language-server
            luajitPackages.luacheck
            nyxvampNeovim
            tree-sitter
            nodejs
            ripgrep
          ];
        };

        packages = {
          default = nyxvampPlugin;
          nyxvamp-plugin = nyxvampPlugin;
          nyxvamp-neovim = nyxvampNeovim;
        };

        apps = {
          default = {
            type = "app";
            program = "${nyxvampNeovim}/bin/nvim";
          };
        };

        checks = {
          plugin-builds = nyxvampPlugin;
          neovim-builds = nyxvampNeovim;
        };
      }
    );
}
