{ pkgs
, ... }:

pkgs.mkShell {
  name = "golang";
  buildInputs = with pkgs; [
    figlet
    go
    gopls
    gofumpt
    gotools
    go-tools
  ];
  shellHook = ''
    figlet go-flake
  '';
}
