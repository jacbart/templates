{
  description = "nodejs version 20";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };
  outputs = { self, nixpkgs }:
  let
    inherit (nixpkgs) lib;
    allSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
    forAllSystems = f: nixpkgs.lib.genAttrs allSystems (system: f {
      pkgs = import nixpkgs { inherit system; };
    });
  in {
    packages = forAllSystems ({ pkgs }: {
      default = pkgs.stdenv.mkDerivation {
        name = "PROJECT_NAME";
        src = lib.cleanSource self;
        buildInputs = [ pkgs.nodejs_20 ];
        buildPhase = ''
          npm install
          npm run build
        '';
        installPhase = ''
          mv ./build $out/bin
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
      };
    });
    devShells = forAllSystems ({ pkgs }: {
        default = pkgs.mkShell {
          name = "node20";
          buildInputs = with pkgs; [
            figlet
            nodejs_20
          ];
          shellHook = ''
            figlet node v20
          '';
        };
    });
    # hydraJobs."PROJECT_NAME" = forAllSystems ({ pkgs }: self.packages.${pkgs.stenv.system}.default);
  };
}
