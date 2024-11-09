{
  description = "rust flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
  };

  outputs = { self, nixpkgs, rust-overlay, ... }:
  let
    projectRustVersion = "1.82.0";
    inherit (nixpkgs) lib;
    allSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
    overlays = [ (import rust-overlay) ];
    forAllSystems = f: nixpkgs.lib.genAttrs allSystems (system: f {
      pkgs = import nixpkgs { inherit system overlays; };
    });
  in {
    packages = forAllSystems ({ pkgs }:
    let
      rustVersion = pkgs.rust-bin.stable.${projectRustVersion}.default;
    in {
      default = pkgs.callPackage ./default.nix {
        inherit pkgs rustVersion;
      };
    });
    devShells = forAllSystems ({ pkgs }:
    let
      rustVersion = pkgs.rust-bin.stable.${projectRustVersion}.default;
    in {
      default = pkgs.callPackage ./shell.nix {
        inherit pkgs rustVersion;
      };
    });
    # hydraJobs."BIN_NAME" = forAllSystems ({ pkgs }: self.packages.${pkgs.stdenv.system}.default);
  };
}
