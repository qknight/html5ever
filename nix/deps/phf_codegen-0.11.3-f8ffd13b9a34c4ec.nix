# generated from rustc-call.nix.handlebars
{ fn, pkgs, rustc, cargo, phf_generator-0_11_3-c688b166d2afc894, phf_shared-0_11_3-ec50c9c17879817d }:
let
  rustc_arguments="";
in
  pkgs.stdenv.mkDerivation rec {
    name = "phf_codegen-0_11_3-f8ffd13b9a34c4ec";
    buildInputs = [];
    passthru.rust_crate_libraries = [phf_generator-0_11_3-c688b166d2afc894 phf_shared-0_11_3-ec50c9c17879817d];
    passthru.rust_crate_parent = [];
    passthru.rust_script_build_run = [];
    phases = "unpackPhase buildPhase";

    src = pkgs.fetchurl {
      url = "https://crates.io/api/v1/crates/phf_codegen/0.11.3/download";
      sha256 = "aef8048c789fa5e851558d709946d6d79a8ff88c0440c587967f8e94bfb1216a";
    };
    unpackPhase = ''
      tar xf $src
      cd phf_codegen-0.11.3
    '';

    RUSTC = "${rustc}/bin/rustc";
    CARGO = "${cargo}/bin/cargo";

    CARGO_CRATE_NAME = "phf_codegen";
    CARGO_MANIFEST_DIR = "./";
    CARGO_MANIFEST_PATH = "./Cargo.toml";
    CARGO_PKG_AUTHORS = "Steven Fackler <sfackler@gmail.com>";
    CARGO_PKG_DESCRIPTION = "Codegen library for PHF types";
    CARGO_PKG_HOMEPAGE = "";
    CARGO_PKG_LICENSE = "MIT";
    CARGO_PKG_LICENSE_FILE = "";
    CARGO_PKG_NAME = "phf_codegen";
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

      echo -e "\e[92mCompiling\e[0m phf_codegen-0_11_3-f8ffd13b9a34c4ec"

      (set -x 
      ${rustc}/bin/rustc \
        --crate-name phf_codegen \
        --edition=2021 src/lib.rs \
        --crate-type lib \
        --emit=dep-info,metadata,link \
        -C embed-bitcode=no \
        ${rustc_arguments} \
        --check-cfg 'cfg(docsrs,test)' \
        --check-cfg 'cfg(feature, values())' \
        -C metadata=7de64a00d1654574 \
        -C extra-filename=-f8ffd13b9a34c4ec \
        --out-dir $OUT_DIR \
        ${fn.rustc_linker_arguments passthru.rust_crate_libraries} \
        ${fn.rustc_propagated_arguments passthru.rust_script_build_run} \
        --extern phf_generator=${phf_generator-0_11_3-c688b166d2afc894}/libphf_generator-c688b166d2afc894.rmeta \
        --extern phf_shared=${phf_shared-0_11_3-ec50c9c17879817d}/libphf_shared-ec50c9c17879817d.rmeta \
        --cap-lints allow

      )
    '';
}
