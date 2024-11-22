{ pkgs ? import <nixpkgs> { }, ... }:
pkgs.mkShell {
  name = "minimal";
  buildInputs = with pkgs; [
    figlet
  ];
  shellHook = ''
    figlet minimal
  '';
}
