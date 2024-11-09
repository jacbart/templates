{ pkgs ? import <nixpkgs> {}
, rustVersion
, ... }:

pkgs.mkShell {
  name = "rust";
  buildInputs = with pkgs; [
    (rustVersion.override { extensions = [ "rust-src" ]; })
    rust-analyzer
    figlet
  ];
  shellHook = ''
    figlet rust-flake
  '';
}
