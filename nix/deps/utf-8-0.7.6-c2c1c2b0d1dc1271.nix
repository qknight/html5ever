# generated from rustc-call.nix.handlebars
{ fn, pkgs, rustc, cargo }:
let
  rustc_arguments="";
in
  pkgs.stdenv.mkDerivation rec {
    name = "utf-8-0_7_6-c2c1c2b0d1dc1271";
    buildInputs = [];
    passthru.rust_crate_libraries = [];
    passthru.rust_crate_parent = [];
    passthru.rust_script_build_run = [];
    phases = "unpackPhase buildPhase";

    src = pkgs.fetchurl {
      url = "https://crates.io/api/v1/crates/utf-8/0.7.6/download";
      sha256 = "09cc8ee72d2a9becf2f2febe0205bbed8fc6615b7cb429ad062dc7b7ddd036a9";
    };
    unpackPhase = ''
      tar xf $src
      cd utf-8-0.7.6
    '';

    RUSTC = "${rustc}/bin/rustc";
    CARGO = "${cargo}/bin/cargo";

    CARGO_CRATE_NAME = "utf8";
    CARGO_MANIFEST_DIR = "./";
    CARGO_MANIFEST_PATH = "./Cargo.toml";
    CARGO_PKG_AUTHORS = "Simon Sapin <simon.sapin@exyr.org>";
    CARGO_PKG_DESCRIPTION = "Incremental, zero-copy UTF-8 decoding with error handling";
    CARGO_PKG_HOMEPAGE = "";
    CARGO_PKG_LICENSE = "MIT OR Apache-2.0";
    CARGO_PKG_LICENSE_FILE = "";
    CARGO_PKG_NAME = "utf-8";
    CARGO_PKG_README = "README.md";
    CARGO_PKG_REPOSITORY = "https://github.com/SimonSapin/rust-utf8";
    CARGO_PKG_RUST_VERSION = "";
    CARGO_PKG_VERSION = "0.7.6";
    CARGO_PKG_VERSION_MAJOR = "0";
    CARGO_PKG_VERSION_MINOR = "7";
    CARGO_PKG_VERSION_PATCH = "6";
    CARGO_PKG_VERSION_PRE = "";

    buildPhase = ''
      export CARGO_MANIFEST_DIR=$(realpath $PWD/$CARGO_MANIFEST_DIR)
      export CARGO_MANIFEST_PATH=$(realpath $PWD/$CARGO_MANIFEST_PATH)

      mkdir -p $out
      export OUT_DIR=$out
      export INC_DIR=$(mktemp -d)

      echo -e "\e[92mCompiling\e[0m utf-8-0_7_6-c2c1c2b0d1dc1271"

      (set -x 
      ${rustc}/bin/rustc \
        --crate-name utf8 \
        --edition=2015 src/lib.rs \
        --crate-type lib \
        --emit=dep-info,metadata,link \
        -C embed-bitcode=no \
        -C debuginfo=2 \
        ${rustc_arguments} \
        --check-cfg 'cfg(docsrs,test)' \
        --check-cfg 'cfg(feature, values())' \
        -C metadata=5da2c7e06b2065bd \
        -C extra-filename=-c2c1c2b0d1dc1271 \
        --out-dir $OUT_DIR \
        ${fn.rustc_linker_arguments passthru.rust_crate_libraries} \
        ${fn.rustc_propagated_arguments passthru.rust_script_build_run} \
        --cap-lints allow

      )
    '';
}
