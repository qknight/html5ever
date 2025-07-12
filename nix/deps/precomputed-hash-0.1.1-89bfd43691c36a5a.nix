# generated from rustc-call.nix.handlebars
{ fn, pkgs, rustc, cargo }:
let
  rustc_arguments="";
in
  pkgs.stdenv.mkDerivation rec {
    name = "precomputed-hash-0_1_1-89bfd43691c36a5a";
    buildInputs = [];
    passthru.rust_crate_libraries = [];
    passthru.rust_crate_parent = [];
    passthru.rust_script_build_run = [];
    phases = "unpackPhase buildPhase";

    src = pkgs.fetchurl {
      url = "https://crates.io/api/v1/crates/precomputed-hash/0.1.1/download";
      sha256 = "925383efa346730478fb4838dbe9137d2a47675ad789c546d150a6e1dd4ab31c";
    };
    unpackPhase = ''
      tar xf $src
      cd precomputed-hash-0.1.1
    '';

    RUSTC = "${rustc}/bin/rustc";
    CARGO = "${cargo}/bin/cargo";

    CARGO_CRATE_NAME = "precomputed_hash";
    CARGO_MANIFEST_DIR = "./";
    CARGO_MANIFEST_PATH = "./Cargo.toml";
    CARGO_PKG_AUTHORS = "Emilio Cobos Álvarez <emilio@crisal.io>";
    CARGO_PKG_DESCRIPTION = "A library intending to be a base dependency to expose a precomputed hash";
    CARGO_PKG_HOMEPAGE = "";
    CARGO_PKG_LICENSE = "MIT";
    CARGO_PKG_LICENSE_FILE = "";
    CARGO_PKG_NAME = "precomputed-hash";
    CARGO_PKG_README = "";
    CARGO_PKG_REPOSITORY = "https://github.com/emilio/precomputed-hash";
    CARGO_PKG_RUST_VERSION = "";
    CARGO_PKG_VERSION = "0.1.1";
    CARGO_PKG_VERSION_MAJOR = "0";
    CARGO_PKG_VERSION_MINOR = "1";
    CARGO_PKG_VERSION_PATCH = "1";
    CARGO_PKG_VERSION_PRE = "";

    buildPhase = ''
      export CARGO_MANIFEST_DIR=$(realpath $PWD/$CARGO_MANIFEST_DIR)
      export CARGO_MANIFEST_PATH=$(realpath $PWD/$CARGO_MANIFEST_PATH)

      mkdir -p $out
      export OUT_DIR=$out
      export INC_DIR=$(mktemp -d)

      echo -e "\e[92mCompiling\e[0m precomputed-hash-0_1_1-89bfd43691c36a5a"

      (set -x 
      ${rustc}/bin/rustc \
        --crate-name precomputed_hash \
        --edition=2015 src/lib.rs \
        --crate-type lib \
        --emit=dep-info,metadata,link \
        -C embed-bitcode=no \
        -C debuginfo=2 \
        ${rustc_arguments} \
        --check-cfg 'cfg(docsrs,test)' \
        --check-cfg 'cfg(feature, values())' \
        -C metadata=19eb64f5f596c95e \
        -C extra-filename=-89bfd43691c36a5a \
        --out-dir $OUT_DIR \
        ${fn.rustc_linker_arguments passthru.rust_crate_libraries} \
        ${fn.rustc_propagated_arguments passthru.rust_script_build_run} \
        --cap-lints allow

      )
    '';
}
