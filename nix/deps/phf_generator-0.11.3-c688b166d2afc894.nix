# generated from rustc-call.nix.handlebars
{ fn, pkgs, rustc, cargo, phf_shared-0_11_3-ec50c9c17879817d, rand-0_8_5-3ecba6d7e515d9fc }:
let
  rustc_arguments="";
in
  pkgs.stdenv.mkDerivation rec {
    name = "phf_generator-0_11_3-c688b166d2afc894";
    buildInputs = [];
    passthru.rust_crate_libraries = [phf_shared-0_11_3-ec50c9c17879817d rand-0_8_5-3ecba6d7e515d9fc];
    passthru.rust_crate_parent = [];
    passthru.rust_script_build_run = [];
    phases = "unpackPhase buildPhase";

    src = pkgs.fetchurl {
      url = "https://crates.io/api/v1/crates/phf_generator/0.11.3/download";
      sha256 = "3c80231409c20246a13fddb31776fb942c38553c51e871f8cbd687a4cfb5843d";
    };
    unpackPhase = ''
      tar xf $src
      cd phf_generator-0.11.3
    '';

    RUSTC = "${rustc}/bin/rustc";
    CARGO = "${cargo}/bin/cargo";

    CARGO_CRATE_NAME = "phf_generator";
    CARGO_MANIFEST_DIR = "./";
    CARGO_MANIFEST_PATH = "./Cargo.toml";
    CARGO_PKG_AUTHORS = "Steven Fackler <sfackler@gmail.com>";
    CARGO_PKG_DESCRIPTION = "PHF generation logic";
    CARGO_PKG_HOMEPAGE = "";
    CARGO_PKG_LICENSE = "MIT";
    CARGO_PKG_LICENSE_FILE = "";
    CARGO_PKG_NAME = "phf_generator";
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

      echo -e "\e[92mCompiling\e[0m phf_generator-0_11_3-c688b166d2afc894"

      (set -x 
      ${rustc}/bin/rustc \
        --crate-name phf_generator \
        --edition=2021 src/lib.rs \
        --crate-type lib \
        --emit=dep-info,metadata,link \
        -C embed-bitcode=no \
        ${rustc_arguments} \
        --check-cfg 'cfg(docsrs,test)' \
        --check-cfg 'cfg(feature, values("criterion"))' \
        -C metadata=f51fe3ee641056a0 \
        -C extra-filename=-c688b166d2afc894 \
        --out-dir $OUT_DIR \
        ${fn.rustc_linker_arguments passthru.rust_crate_libraries} \
        ${fn.rustc_propagated_arguments passthru.rust_script_build_run} \
        --extern phf_shared=${phf_shared-0_11_3-ec50c9c17879817d}/libphf_shared-ec50c9c17879817d.rmeta \
        --extern rand=${rand-0_8_5-3ecba6d7e515d9fc}/librand-3ecba6d7e515d9fc.rmeta \
        --cap-lints allow

      )
    '';
}
