{
  description = "simple golang flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: 
  let
    supportedSystems = [ "x86_64-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin" ];
    forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
    nixpkgsFor = forAllSystems (system: import nixpkgs { inherit system; });
  in {
    packages = forAllSystems (system:
      let
        pkgs = nixpkgsFor.${system};
      in {
        mainPkg = pkgs.buildGoModule rec {
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
            mainProgram = "BIN_NAME";
            description = "";
            longDescription = ''
            '';
            homepage = "https://github.com/jacbart/BIN_NAME";
            license = with licenses; [ mpl20 ];
            maintainers = with maintainers; [ jacbart ];
            platforms = platforms.all;
          };
        };
    });
    devShells = forAllSystems (system:
      let
        pkgs = nixpkgsFor.${system};
      in {
        default = pkgs.mkShell {
          name = "golang";
          buildInputs = with pkgs; [
            go
            gopls
            gotools
            go-tools
          ];
        };
    });

    defaultPackage = forAllSystems (system: self.packages.${system}.mainPkg);
  };
}
