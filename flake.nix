{
  description = "tmux-sessionizer (crab style)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    flake-utils.url = "github:numtide/flake-utils";

  };

  outputs = { self, nixpkgs, crane, flake-utils, advisory-db, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };

        inherit (pkgs) lib;
      in
      {

        devShells.default = pkgs.mkShell {
          # Extra inputs can be added here
          nativeBuildInputs = with pkgs; [
            ruby
          ];
        };
      });
}
