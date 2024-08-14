{
  description = "minimal flake project";

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
        default = pkgs.stdenv.mkDerivation {
          name = "minimal";
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
        };
      }
    );
    devShells = forAllSystems (system:
      let
        pkgs = nixpkgsFor.${system};
      in {
        default = pkgs.mkShell {
          name = "minimal";
          buildInputs = with pkgs; [
            figlet
          ];
          shellHook = ''
            figlet minimal
          '';
        };
    });
  };
}
