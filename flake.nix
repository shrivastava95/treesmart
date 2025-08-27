{
  description = "treesmart - tree with depth & entry limits";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs";

  outputs = { self, nixpkgs }:
    let
      systems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system:
        f (import nixpkgs { inherit system; }));
    in {
      packages = forAllSystems (pkgs: {
        default = pkgs.stdenv.mkDerivation {
          pname = "treesmart";
          version = "git"; 

          src = ./.;

          installPhase = ''
            mkdir -p $out/bin
            cp treesmart/treesmart.sh $out/bin/treesmart
            chmod +x $out/bin/treesmart
          '';
        };
      });

      apps = forAllSystems (pkgs: {
        default = {
          type = "app";
          program = "${self.packages.${pkgs.system}.default}/bin/treesmart";
        };
      });
    };
}

