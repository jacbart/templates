{ pkgs
, ... }:

pkgs.buildGoModule rec {
  pname = "BIN_NAME";
  src = pkgs.lib.cleanSource ./.;
  version = "0.0.1";
  # ldflags = [
  #   "-s" "-w"
  #   "-X 'main.Version=${version}'"
  #   "-X 'main.Date=20xx-xx-xx'"
  # ];
  # vendorSha256 = sha256:;
  vendorSha256 = pkgs.lib.fakeSha256;

  meta = with pkgs.lib; {
    mainProgram = pname;
    description = "";
    longDescription = ''
    '';
    homepage = "https://github.com/jacbart/BIN_NAME";
    license = with licenses; [ mpl20 ];
    maintainers = with maintainers; [ jacbart ];
    platforms = platforms.all;
  };
}
