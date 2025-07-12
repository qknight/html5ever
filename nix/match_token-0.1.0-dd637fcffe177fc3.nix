# generated from rustc-call.nix.handlebars
{ fn, pkgs, rustc, cargo, proc-macro2-1_0_94-c00d5f2e4566fe3d, quote-1_0_39-7726c3a92da25f8b, syn-2_0_99-5289b1241fd66725 }:
let
  rustc_arguments="";
in
  pkgs.stdenv.mkDerivation rec {
    name = "match_token-0_1_0-dd637fcffe177fc3";
    buildInputs = [];
    passthru.rust_crate_libraries = [proc-macro2-1_0_94-c00d5f2e4566fe3d quote-1_0_39-7726c3a92da25f8b syn-2_0_99-5289b1241fd66725];
    passthru.rust_crate_parent = [];
    passthru.rust_script_build_run = [];
    phases = "unpackPhase buildPhase";

    src = builtins.filterSource
      (path: type:
        let base = baseNameOf path;
        in !(base == "target" || base == "result" || builtins.match "result-*" base != null)
      ) /home/nixos/html5ever;
    unpackPhase = "";

    RUSTC = "${rustc}/bin/rustc";
    CARGO = "${cargo}/bin/cargo";

    CARGO_CRATE_NAME = "match_token";
    CARGO_MANIFEST_DIR = "./match_token";
    CARGO_MANIFEST_PATH = "./match_token/Cargo.toml";
    CARGO_PKG_AUTHORS = "";
    CARGO_PKG_DESCRIPTION = "Procedural macro for html5ever.";
    CARGO_PKG_HOMEPAGE = "";
    CARGO_PKG_LICENSE = "MIT OR Apache-2.0";
    CARGO_PKG_LICENSE_FILE = "";
    CARGO_PKG_NAME = "match_token";
    CARGO_PKG_README = "";
    CARGO_PKG_REPOSITORY = "https://github.com/servo/html5ever";
    CARGO_PKG_RUST_VERSION = "";
    CARGO_PKG_VERSION = "0.1.0";
    CARGO_PKG_VERSION_MAJOR = "0";
    CARGO_PKG_VERSION_MINOR = "1";
    CARGO_PKG_VERSION_PATCH = "0";
    CARGO_PKG_VERSION_PRE = "";
    CARGO_PRIMARY_PACKAGE = "1";
    CARGO_SBOM_PATH = "";

    buildPhase = ''
      export CARGO_MANIFEST_DIR=$(realpath $PWD/$CARGO_MANIFEST_DIR)
      export CARGO_MANIFEST_PATH=$(realpath $PWD/$CARGO_MANIFEST_PATH)

      mkdir -p $out
      export OUT_DIR=$out
      export INC_DIR=$(mktemp -d)

      echo -e "\e[92mCompiling\e[0m match_token-0_1_0-dd637fcffe177fc3"

      (set -x 
      ${rustc}/bin/rustc \
        --crate-name match_token \
        --edition=2021 match_token/src/lib.rs \
        --crate-type proc-macro \
        --emit=dep-info,link \
        -C prefer-dynamic \
        -C embed-bitcode=no \
        -C debuginfo=2 \
        ${rustc_arguments} \
        --check-cfg 'cfg(docsrs,test)' \
        --check-cfg 'cfg(feature, values())' \
        -C metadata=81130888085c99bc \
        -C extra-filename=-dd637fcffe177fc3 \
        --out-dir $OUT_DIR \
        ${fn.rustc_linker_arguments passthru.rust_crate_libraries} \
        ${fn.rustc_propagated_arguments passthru.rust_script_build_run} \
        --extern proc_macro2=${proc-macro2-1_0_94-c00d5f2e4566fe3d}/libproc_macro2-c00d5f2e4566fe3d.rlib \
        --extern quote=${quote-1_0_39-7726c3a92da25f8b}/libquote-7726c3a92da25f8b.rlib \
        --extern syn=${syn-2_0_99-5289b1241fd66725}/libsyn-5289b1241fd66725.rlib \
        --extern proc_macro

      )
    '';
}
