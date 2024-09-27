{
  description = "rust flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
  };

  outputs = { self, nixpkgs, rust-overlay, ... }:
  let
    inherit (nixpkgs) lib;
    allSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
    overlays = [ (import rust-overlay) ];
    forAllSystems = f: nixpkgs.lib.genAttrs allSystems (system: f {
      pkgs = import nixpkgs { inherit system overlays; };
    });
  in {
    packages = forAllSystems ({ pkgs }:
    let
      rustVersion = pkgs.rust-bin.stable."1.80.1".default;
      rustPlatform = pkgs.makeRustPlatform {
        cargo = rustVersion;
        rustc = rustVersion;
      };
    in {
      default = rustPlatform.buildRustPackage {
        pname = "BIN_NAME";
        version = "0.0.1";
        src = lib.cleanSource self;
        cargoLock.lockFile = ./Cargo.lock;
        meta = with pkgs.lib; {
          description = "";
          homepage = "https://github.com/jacbart/BIN_NAME";
          license = with licenses; [ mpl20 ];
          maintainers = with maintainers; [ jacbart ];
        };
      };
    });
    devShell = forAllSystems ({ pkgs }: {
      default = pkgs.mkShell {
        name = "rust";
        buildInputs = with pkgs; [
          (rustVersion.override { extensions = [ "rust-src" ]; })
          rust-analyzer
          figlet
        ];
        shellHook = ''
          figlet rust-flake
        '';
      };
    });
    defaultPackage = forAllSystems ({ pkgs }: self.packages.${pkgs.stdenv.system}.default);
    # hydraJobs."BIN_NAME" = forAllSystems ({ pkgs }: self.packages.${pkgs.stenv.system}.default);
  };
}
