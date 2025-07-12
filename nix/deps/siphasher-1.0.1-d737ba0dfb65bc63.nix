# generated from rustc-call.nix.handlebars
{ fn, pkgs, rustc, cargo }:
let
  rustc_arguments="";
in
  pkgs.stdenv.mkDerivation rec {
    name = "siphasher-1_0_1-d737ba0dfb65bc63";
    buildInputs = [];
    passthru.rust_crate_libraries = [];
    passthru.rust_crate_parent = [];
    passthru.rust_script_build_run = [];
    phases = "unpackPhase buildPhase";

    src = pkgs.fetchurl {
      url = "https://crates.io/api/v1/crates/siphasher/1.0.1/download";
      sha256 = "56199f7ddabf13fe5074ce809e7d3f42b42ae711800501b5b16ea82ad029c39d";
    };
    unpackPhase = ''
      tar xf $src
      cd siphasher-1.0.1
    '';

    RUSTC = "${rustc}/bin/rustc";
    CARGO = "${cargo}/bin/cargo";

    CARGO_CRATE_NAME = "siphasher";
    CARGO_MANIFEST_DIR = "./";
    CARGO_MANIFEST_PATH = "./Cargo.toml";
    CARGO_PKG_AUTHORS = "Frank Denis <github@pureftpd.org>";
    CARGO_PKG_DESCRIPTION = "SipHash-2-4, SipHash-1-3 and 128-bit variants in pure Rust";
    CARGO_PKG_HOMEPAGE = "https://docs.rs/siphasher";
    CARGO_PKG_LICENSE = "MIT/Apache-2.0";
    CARGO_PKG_LICENSE_FILE = "";
    CARGO_PKG_NAME = "siphasher";
    CARGO_PKG_README = "README.md";
    CARGO_PKG_REPOSITORY = "https://github.com/jedisct1/rust-siphash";
    CARGO_PKG_RUST_VERSION = "";
    CARGO_PKG_VERSION = "1.0.1";
    CARGO_PKG_VERSION_MAJOR = "1";
    CARGO_PKG_VERSION_MINOR = "0";
    CARGO_PKG_VERSION_PATCH = "1";
    CARGO_PKG_VERSION_PRE = "";

    buildPhase = ''
      export CARGO_MANIFEST_DIR=$(realpath $PWD/$CARGO_MANIFEST_DIR)
      export CARGO_MANIFEST_PATH=$(realpath $PWD/$CARGO_MANIFEST_PATH)

      mkdir -p $out
      export OUT_DIR=$out
      export INC_DIR=$(mktemp -d)

      echo -e "\e[92mCompiling\e[0m siphasher-1_0_1-d737ba0dfb65bc63"

      (set -x 
      ${rustc}/bin/rustc \
        --crate-name siphasher \
        --edition=2018 src/lib.rs \
        --crate-type lib \
        --emit=dep-info,metadata,link \
        -C embed-bitcode=no \
        -C debuginfo=2 \
        ${rustc_arguments} \
        --cfg 'feature="default"' \
        --cfg 'feature="std"' \
        --check-cfg 'cfg(docsrs,test)' \
        --check-cfg 'cfg(feature, values("default", "serde", "serde_json", "serde_no_std", "serde_std", "std"))' \
        -C metadata=10fdbfb4a7249035 \
        -C extra-filename=-d737ba0dfb65bc63 \
        --out-dir $OUT_DIR \
        ${fn.rustc_linker_arguments passthru.rust_crate_libraries} \
        ${fn.rustc_propagated_arguments passthru.rust_script_build_run} \
        --cap-lints allow

      )
    '';
}
