{
  description = "nodejs version 18";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };
  outputs = { self, nixpkgs }:
  let
    supportedSystems = [ "x86_64-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin" ];
    forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
    nixpkgsFor = forAllSystems (system: import nixpkgs { inherit system; });
  in {
    devShells = forAllSystems (system:
      let
        pkgs = nixpkgsFor.${system};
      in {
        default = pkgs.mkShell {
          name = "node18";
          buildInputs = with pkgs; [
            figlet
            nodejs_18
          ];
          shellHook = ''
            figlet node v18
          '';
        };
    });
  };
}
