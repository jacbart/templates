{
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        flake-utils.url = "github:numtide/flake-utils";
        rust-overlay.url = "github:oxalica/rust-overlay";
    };

    outputs = { self, nixpkgs, rust-overlay, flake-utils, ... }:
        flake-utils.lib.eachDefaultSystem (system:
        let
            overlays = [ (import rust-overlay) ];
            pkgs = import nixpkgs {
                inherit system overlays;
            };

            rustVersion = pkgs.rust-bin.stable."1.76.0".default;

            rustPlatform = pkgs.makeRustPlatform {
                cargo = rustVersion;
                rustc = rustVersion;
            };

            rustPkgs = rustPlatform.buildRustPackage {
                pname = "BIN_NAME";
                version = "0.0.1";
                src = ./.;
                cargoLock.lockFile = ./Cargo.lock;
                meta = with pkgs.lib; {
                    description = "description placeholder";
                    homepage = "github.com/jacbart/BIN_NAME";
                    license = with licenses; [ mpl20 ];
                    maintainers = with maintainers; [ jacbart ];
                };
            };
        in with pkgs; {
            defaultPackage = rustPkgs;
            devShell = pkgs.mkShell {
                name = "rust";
                buildInputs = with pkgs; [
                    (rustVersion.override { extensions = [ "rust-src" ]; })
                    rust-analyzer
                ];
            };
        });
}
