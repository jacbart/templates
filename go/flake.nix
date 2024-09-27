{
  description = "simple golang flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: 
  let
    # inherit (nixpkgs) lib;
    allSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
    forAllSystems = f: nixpkgs.lib.genAttrs allSystems (system: f {
      pkgs = import nixpkgs { inherit system; };
    });
  in {
    packages = forAllSystems ({ pkgs }: {
      default = pkgs.buildGoModule rec {
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
      };
    });
    devShells = forAllSystems ({ pkgs }: {
      default = pkgs.mkShell {
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
      };
    });
    # hydraJobs."BIN_NAME" = forAllSystems ({ pkgs }: self.packages.${pkgs.stdenv.system}.default);
  };
}
