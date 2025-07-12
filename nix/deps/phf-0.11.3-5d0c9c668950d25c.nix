# generated from rustc-call.nix.handlebars
{ fn, pkgs, rustc, cargo, phf_shared-0_11_3-ec50c9c17879817d }:
let
  rustc_arguments="";
in
  pkgs.stdenv.mkDerivation rec {
    name = "phf-0_11_3-5d0c9c668950d25c";
    buildInputs = [];
    passthru.rust_crate_libraries = [phf_shared-0_11_3-ec50c9c17879817d];
    passthru.rust_crate_parent = [];
    passthru.rust_script_build_run = [];
    phases = "unpackPhase buildPhase";

    src = pkgs.fetchurl {
      url = "https://crates.io/api/v1/crates/phf/0.11.3/download";
      sha256 = "1fd6780a80ae0c52cc120a26a1a42c1ae51b247a253e4e06113d23d2c2edd078";
    };
    unpackPhase = ''
      tar xf $src
      cd phf-0.11.3
    '';

    RUSTC = "${rustc}/bin/rustc";
    CARGO = "${cargo}/bin/cargo";

    CARGO_CRATE_NAME = "phf";
    CARGO_MANIFEST_DIR = "./";
    CARGO_MANIFEST_PATH = "./Cargo.toml";
    CARGO_PKG_AUTHORS = "Steven Fackler <sfackler@gmail.com>";
    CARGO_PKG_DESCRIPTION = "Runtime support for perfect hash function data structures";
    CARGO_PKG_HOMEPAGE = "";
    CARGO_PKG_LICENSE = "MIT";
    CARGO_PKG_LICENSE_FILE = "";
    CARGO_PKG_NAME = "phf";
    CARGO_PKG_README = "README.md";
    CARGO_PKG_REPOSITORY = "https://github.com/rust-phf/rust-phf";
    CARGO_PKG_RUST_VERSION = "1.61";
    CARGO_PKG_VERSION = "0.11.3";
    CARGO_PKG_VERSION_MAJOR = "0";
    CARGO_PKG_VERSION_MINOR = "11";
    CARGO_PKG_VERSION_PATCH = "3";
    CARGO_PKG_VERSION_PRE = "";

    buildPhase = ''
      export CARGO_MANIFEST_DIR=$(realpath $PWD/$CARGO_MANIFEST_DIR)
      export CARGO_MANIFEST_PATH=$(realpath $PWD/$CARGO_MANIFEST_PATH)

      mkdir -p $out
      export OUT_DIR=$out
      export INC_DIR=$(mktemp -d)

      echo -e "\e[92mCompiling\e[0m phf-0_11_3-5d0c9c668950d25c"

      (set -x 
      ${rustc}/bin/rustc \
        --crate-name phf \
        --edition=2021 src/lib.rs \
        --crate-type lib \
        --emit=dep-info,metadata,link \
        -C embed-bitcode=no \
        -C debuginfo=2 \
        ${rustc_arguments} \
        --cfg 'feature="default"' \
        --cfg 'feature="std"' \
        --check-cfg 'cfg(docsrs,test)' \
        --check-cfg 'cfg(feature, values("default", "macros", "phf_macros", "serde", "std", "uncased", "unicase"))' \
        -C metadata=0ad89fc94a4eff37 \
        -C extra-filename=-5d0c9c668950d25c \
        --out-dir $OUT_DIR \
        ${fn.rustc_linker_arguments passthru.rust_crate_libraries} \
        ${fn.rustc_propagated_arguments passthru.rust_script_build_run} \
        --extern phf_shared=${phf_shared-0_11_3-ec50c9c17879817d}/libphf_shared-ec50c9c17879817d.rmeta \
        --cap-lints allow

      )
    '';
}
