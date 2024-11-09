{ pkgs ? import <nixpkgs> {}
, ... }:

pkgs.stdenv.mkDerivation {
  name = "PROJECT_NAME";
  src = null;
  buildPhase = ''
  '';
  installPhase = ''
  '';
  meta = with pkgs.lib; {
    mainProgram = "PROJECT_NAME";
    description = "";
    longDescription = ''
    '';
    homepage = "https://github.com/jacbart/PROJECT_NAME";
    license = with licenses; [ mpl20 ];
    maintainers = with maintainers; [ jacbart ];
    platforms = platforms.all;
  };
}
