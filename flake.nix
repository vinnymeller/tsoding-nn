{
    description = "Simple C project flake";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        flake-utils.url = "github:numtide/flake-utils";
    };

    outputs = { self, nixpkgs, flake-utils, ... }:
        flake-utils.lib.eachDefaultSystem (system:

            let
                pkgs = import nixpkgs {
                inherit system;
                };
            in {
                devShells.default = pkgs.mkShell {
                    name = "tsoding-nn-shell";
                    buildInputs = with pkgs; [
                        clang
                        raylib
                        glfw
                        pkg-config
                    ];
                    # shellHook = ''
                    #     export CFLAGS="$CFLAGS -I${pkgs.raylib}/include"
                    #     export LDFLAGS="$LDFLAGS -L${pkgs.raylib}/lib"
                    # '';
                };
            }
        );
}
