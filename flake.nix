{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs = {
    self,
    nixpkgs,
    ...
  }: let
    supportedSystems = [
      "x86_64-linux"
      "aarch64-linux"

      "x86_64-darwin"
      "aarch64-darwin"
    ];
    forEachSupportedSystem = nixpkgs.lib.genAttrs supportedSystems;
    pkgsFor = system:
      import nixpkgs {
        inherit system;
        overlays = [self.outputs.overlays.default];
      };
  in {
    overlays.default = final: prev: {
      deno2nix = {
        mkBundled = final.callPackage ./nix/mk-bundled.nix {};
        mkBundledWrapper = final.callPackage ./nix/mk-bundled-wrapper.nix {};
        mkExecutable = final.callPackage ./nix/mk-executable.nix {};

        internal = final.callPackage ./nix/internal {};
      };
    };

    checks = forEachSupportedSystem (system: let
      pkgs = pkgsFor system;
    in {
      "simple/deps-link" = pkgs.callPackage ./examples/simple/deps-link.nix {};
      "simple/bundled" = pkgs.callPackage ./examples/simple/bundled.nix {};
      "simple/bundled-wrapper" = pkgs.callPackage ./examples/simple/bundled-wrapper.nix {};

      "simple/executable" = pkgs.callPackage ./examples/simple/executable.nix {};
      "simple-no-importmap/executable" = pkgs.callPackage ./examples/simple-no-importmap/executable.nix {};
    });

    devShells = forEachSupportedSystem (system: let
      pkgs = pkgsFor system;
    in {
      deno2nix = pkgs.mkShell {
        buildInputs = with pkgs; [
          alejandra
          deno
          treefmt
          taplo-cli
        ];
      };

      default = self.outputs.devShells.${system}.deno2nix;
    });
  };
}
