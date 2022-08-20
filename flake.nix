{
  description = "tmux-sessionizer (crab style)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    flake-utils.url = "github:numtide/flake-utils";

  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };

        inherit (pkgs) lib;
      in
      {

        devShells.default =
          let
            gem_setup = ''
              mkdir -p .nix-gems
              export GEM_HOME=$PWD/.nix-gems
              export GEM_PATH=$GEM_HOME
              export PATH=$GEM_HOME/bin:$PATH
              gem install colorize optparse clipboard
            '';
          in
          pkgs.mkShell {
            # Extra inputs can be added here
            nativeBuildInputs = with pkgs; [
              ruby
            ];
            shellHook = ''
              ${gem_setup}
            '';
          };
      });
}
