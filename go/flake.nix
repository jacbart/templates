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
      default = pkgs.callPackage ./default.nix { inherit pkgs; };
    });
    devShells = forAllSystems ({ pkgs }: {
      default = pkgs.callPackage ./shell.nix { inherit pkgs; };
    });
    # hydraJobs."BIN_NAME" = forAllSystems ({ pkgs }: self.packages.${pkgs.stdenv.system}.default);
  };
}
