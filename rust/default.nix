{ pkgs ? import <nixpkgs> {}
, rustVersion
, ... }:
let
  inherit (pkgs) lib;

  rustPlatform = pkgs.makeRustPlatform {
    cargo = rustVersion;
    rustc = rustVersion;
  };
in
rustPlatform.buildRustPackage {
  pname = "BIN_NAME";
  version = "0.0.1";
  src = lib.cleanSource self;
  cargoLock.lockFile = ./Cargo.lock;
  meta = with lib; {
    description = "";
    homepage = "https://github.com/jacbart/BIN_NAME";
    license = with licenses; [ mpl20 ];
    maintainers = with maintainers; [ jacbart ];
  };
}
