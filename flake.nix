# nix build .#xml5ever-0_20_0-956da530969691aa --impure

# html5ever v0.29.1 (/home/nixos/html5ever/html5ever)
# ├── log v0.4.26
# ├── mac v0.1.1
# ├── markup5ever v0.14.2 (/home/nixos/html5ever/markup5ever)
# │   ├── log v0.4.26
# │   ├── phf v0.11.3
# │   │   └── phf_shared v0.11.3
# │   │       └── siphasher v1.0.1
# │   ├── string_cache v0.8.8
# │   │   ├── new_debug_unreachable v1.0.6
# │   │   ├── parking_lot v0.12.3
# │   │   │   ├── lock_api v0.4.12
# │   │   │   │   └── scopeguard v1.2.0
# │   │   │   │   [build-dependencies]
# │   │   │   │   └── autocfg v1.4.0
# │   │   │   └── parking_lot_core v0.9.10
# │   │   │       ├── cfg-if v1.0.0
# │   │   │       ├── libc v0.2.170
# │   │   │       └── smallvec v1.14.0
# │   │   ├── phf_shared v0.11.3 (*)
# │   │   ├── precomputed-hash v0.1.1
# │   │   └── serde v1.0.218
# │   │       └── serde_derive v1.0.218 (proc-macro)
# │   │           ├── proc-macro2 v1.0.94
# │   │           │   └── unicode-ident v1.0.18
# │   │           ├── quote v1.0.39
# │   │           │   └── proc-macro2 v1.0.94 (*)
# │   │           └── syn v2.0.99
# │   │               ├── proc-macro2 v1.0.94 (*)
# │   │               ├── quote v1.0.39 (*)
# │   │               └── unicode-ident v1.0.18
# │   └── tendril v0.4.3
# │       ├── futf v0.1.5
# │       │   ├── mac v0.1.1
# │       │   └── new_debug_unreachable v1.0.6
# │       ├── mac v0.1.1
# │       └── utf-8 v0.7.6
# │   [build-dependencies]
# │   ├── phf_codegen v0.11.3
# │   │   ├── phf_generator v0.11.3
# │   │   │   ├── phf_shared v0.11.3 (*)
# │   │   │   └── rand v0.8.5
# │   │   │       └── rand_core v0.6.4
# │   │   └── phf_shared v0.11.3 (*)
# │   └── string_cache_codegen v0.5.4
# │       ├── phf_generator v0.11.3 (*)
# │       ├── phf_shared v0.11.3 (*)
# │       ├── proc-macro2 v1.0.94 (*)
# │       └── quote v1.0.39 (*)
# └── match_token v0.1.0 (proc-macro) (/home/nixos/html5ever/match_token)
#     ├── proc-macro2 v1.0.94 (*)
#     ├── quote v1.0.39 (*)
#     └── syn v2.0.99 (*)

{
  description = "The fairsync importer prototype flake";
  inputs = {
    nixpkgs.url      = "github:NixOS/nixpkgs/nixos-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
    build-parser.url = "github:nixcloud/cargo-build_script_build-parser";
  };
  outputs =
  { self, nixpkgs, flake-utils, rust-overlay, build-parser }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          overlays = [ (import rust-overlay) build-parser.overlay ];
          pkgs = import nixpkgs {
            inherit system overlays;
          };
          allPackages = import nix/default.nix { inherit pkgs; };
        in
        with pkgs;
        rec {
          packages = allPackages // {
            inherit defaultPackage;
          };
          #leptosfmt = pkgs.callPackage ./leptosfmt.nix {};

          devShells.default = mkShell {
            buildInputs = [
              build-parser.packages.${system}.default
              rust-bin.stable."1.86.0".default
              wasm-pack
              firefox
              binaryen                 # required to minify WASM files with wasm-opt
              git
              pkg-config
              just                     # task runner
            ];
          };
        }
      );
}
