# generated from rustc-call.nix.handlebars
{ fn, pkgs, rustc, cargo, proc-macro2-1_0_94-c00d5f2e4566fe3d }:
let
  rustc_arguments="";
in
  pkgs.stdenv.mkDerivation rec {
    name = "quote-1_0_39-7726c3a92da25f8b";
    buildInputs = [];
    passthru.rust_crate_libraries = [proc-macro2-1_0_94-c00d5f2e4566fe3d];
    passthru.rust_crate_parent = [];
    passthru.rust_script_build_run = [];
    phases = "unpackPhase buildPhase";

    src = pkgs.fetchurl {
      url = "https://crates.io/api/v1/crates/quote/1.0.39/download";
      sha256 = "c1f1914ce909e1658d9907913b4b91947430c7d9be598b15a1912935b8c04801";
    };
    unpackPhase = ''
      tar xf $src
      cd quote-1.0.39
    '';

    RUSTC = "${rustc}/bin/rustc";
    CARGO = "${cargo}/bin/cargo";

    CARGO_CRATE_NAME = "quote";
    CARGO_MANIFEST_DIR = "./";
    CARGO_MANIFEST_PATH = "./Cargo.toml";
    CARGO_PKG_AUTHORS = "David Tolnay <dtolnay@gmail.com>";
    CARGO_PKG_DESCRIPTION = "Quasi-quoting macro quote!(...)";
    CARGO_PKG_HOMEPAGE = "";
    CARGO_PKG_LICENSE = "MIT OR Apache-2.0";
    CARGO_PKG_LICENSE_FILE = "";
    CARGO_PKG_NAME = "quote";
    CARGO_PKG_README = "README.md";
    CARGO_PKG_REPOSITORY = "https://github.com/dtolnay/quote";
    CARGO_PKG_RUST_VERSION = "1.56";
    CARGO_PKG_VERSION = "1.0.39";
    CARGO_PKG_VERSION_MAJOR = "1";
    CARGO_PKG_VERSION_MINOR = "0";
    CARGO_PKG_VERSION_PATCH = "39";
    CARGO_PKG_VERSION_PRE = "";

    buildPhase = ''
      export CARGO_MANIFEST_DIR=$(realpath $PWD/$CARGO_MANIFEST_DIR)
      export CARGO_MANIFEST_PATH=$(realpath $PWD/$CARGO_MANIFEST_PATH)

      mkdir -p $out
      export OUT_DIR=$out
      export INC_DIR=$(mktemp -d)

      echo -e "\e[92mCompiling\e[0m quote-1_0_39-7726c3a92da25f8b"

      (set -x 
      ${rustc}/bin/rustc \
        --crate-name quote \
        --edition=2018 src/lib.rs \
        --crate-type lib \
        --emit=dep-info,metadata,link \
        -C embed-bitcode=no \
        ${rustc_arguments} \
        --cfg 'feature="default"' \
        --cfg 'feature="proc-macro"' \
        --check-cfg 'cfg(docsrs,test)' \
        --check-cfg 'cfg(feature, values("default", "proc-macro"))' \
        -C metadata=2707162896324bb5 \
        -C extra-filename=-7726c3a92da25f8b \
        --out-dir $OUT_DIR \
        ${fn.rustc_linker_arguments passthru.rust_crate_libraries} \
        ${fn.rustc_propagated_arguments passthru.rust_script_build_run} \
        --extern proc_macro2=${proc-macro2-1_0_94-c00d5f2e4566fe3d}/libproc_macro2-c00d5f2e4566fe3d.rmeta \
        --cap-lints allow

      )
    '';
}
