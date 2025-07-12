# generated from rustc-call.nix.handlebars
{ fn, pkgs, rustc, cargo, siphasher-1_0_1-d737ba0dfb65bc63 }:
let
  rustc_arguments="";
in
  pkgs.stdenv.mkDerivation rec {
    name = "phf_shared-0_11_3-ec50c9c17879817d";
    buildInputs = [];
    passthru.rust_crate_libraries = [siphasher-1_0_1-d737ba0dfb65bc63];
    passthru.rust_crate_parent = [];
    passthru.rust_script_build_run = [];
    phases = "unpackPhase buildPhase";

    src = pkgs.fetchurl {
      url = "https://crates.io/api/v1/crates/phf_shared/0.11.3/download";
      sha256 = "67eabc2ef2a60eb7faa00097bd1ffdb5bd28e62bf39990626a582201b7a754e5";
    };
    unpackPhase = ''
      tar xf $src
      cd phf_shared-0.11.3
    '';

    RUSTC = "${rustc}/bin/rustc";
    CARGO = "${cargo}/bin/cargo";

    CARGO_CRATE_NAME = "phf_shared";
    CARGO_MANIFEST_DIR = "./";
    CARGO_MANIFEST_PATH = "./Cargo.toml";
    CARGO_PKG_AUTHORS = "Steven Fackler <sfackler@gmail.com>";
    CARGO_PKG_DESCRIPTION = "Support code shared by PHF libraries";
    CARGO_PKG_HOMEPAGE = "";
    CARGO_PKG_LICENSE = "MIT";
    CARGO_PKG_LICENSE_FILE = "";
    CARGO_PKG_NAME = "phf_shared";
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

      echo -e "\e[92mCompiling\e[0m phf_shared-0_11_3-ec50c9c17879817d"

      (set -x 
      ${rustc}/bin/rustc \
        --crate-name phf_shared \
        --edition=2021 src/lib.rs \
        --crate-type lib \
        --emit=dep-info,metadata,link \
        -C embed-bitcode=no \
        -C debuginfo=2 \
        ${rustc_arguments} \
        --cfg 'feature="default"' \
        --cfg 'feature="std"' \
        --check-cfg 'cfg(docsrs,test)' \
        --check-cfg 'cfg(feature, values("default", "std", "uncased", "unicase"))' \
        -C metadata=f9b5c27997035d79 \
        -C extra-filename=-ec50c9c17879817d \
        --out-dir $OUT_DIR \
        ${fn.rustc_linker_arguments passthru.rust_crate_libraries} \
        ${fn.rustc_propagated_arguments passthru.rust_script_build_run} \
        --extern siphasher=${siphasher-1_0_1-d737ba0dfb65bc63}/libsiphasher-d737ba0dfb65bc63.rmeta \
        --cap-lints allow

      )
    '';
}
