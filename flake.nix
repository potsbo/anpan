{
  description = "anpan - Romaji table renderer to use extended DvorakJP";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        ruby = pkgs.ruby_4_0;
      in
      {
        devShells.default = pkgs.mkShell {
          packages = [
            ruby
            pkgs.git
          ];

          shellHook = ''
            # Keep gems inside the project so the shell stays isolated from the host.
            export BUNDLE_PATH="$PWD/vendor/bundle"
            export GEM_HOME="$PWD/vendor/gem"
            export PATH="$GEM_HOME/bin:$PATH"
          '';
        };
      });
}
