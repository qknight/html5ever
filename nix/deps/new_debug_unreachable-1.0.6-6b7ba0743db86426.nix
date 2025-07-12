# generated from rustc-call.nix.handlebars
{ fn, pkgs, rustc, cargo }:
let
  rustc_arguments="";
in
  pkgs.stdenv.mkDerivation rec {
    name = "new_debug_unreachable-1_0_6-6b7ba0743db86426";
    buildInputs = [];
    passthru.rust_crate_libraries = [];
    passthru.rust_crate_parent = [];
    passthru.rust_script_build_run = [];
    phases = "unpackPhase buildPhase";

    src = pkgs.fetchurl {
      url = "https://crates.io/api/v1/crates/new_debug_unreachable/1.0.6/download";
      sha256 = "650eef8c711430f1a879fdd01d4745a7deea475becfb90269c06775983bbf086";
    };
    unpackPhase = ''
      tar xf $src
      cd new_debug_unreachable-1.0.6
    '';

    RUSTC = "${rustc}/bin/rustc";
    CARGO = "${cargo}/bin/cargo";

    CARGO_CRATE_NAME = "debug_unreachable";
    CARGO_MANIFEST_DIR = "./";
    CARGO_MANIFEST_PATH = "./Cargo.toml";
    CARGO_PKG_AUTHORS = "Matt Brubeck <mbrubeck@limpet.net>:Jonathan Reem <jonathan.reem@gmail.com>";
    CARGO_PKG_DESCRIPTION = "panic in debug, intrinsics::unreachable() in release (fork of debug_unreachable)";
    CARGO_PKG_HOMEPAGE = "";
    CARGO_PKG_LICENSE = "MIT";
    CARGO_PKG_LICENSE_FILE = "";
    CARGO_PKG_NAME = "new_debug_unreachable";
    CARGO_PKG_README = "README.md";
    CARGO_PKG_REPOSITORY = "https://github.com/mbrubeck/rust-debug-unreachable";
    CARGO_PKG_RUST_VERSION = "";
    CARGO_PKG_VERSION = "1.0.6";
    CARGO_PKG_VERSION_MAJOR = "1";
    CARGO_PKG_VERSION_MINOR = "0";
    CARGO_PKG_VERSION_PATCH = "6";
    CARGO_PKG_VERSION_PRE = "";

    buildPhase = ''
      export CARGO_MANIFEST_DIR=$(realpath $PWD/$CARGO_MANIFEST_DIR)
      export CARGO_MANIFEST_PATH=$(realpath $PWD/$CARGO_MANIFEST_PATH)

      mkdir -p $out
      export OUT_DIR=$out
      export INC_DIR=$(mktemp -d)

      echo -e "\e[92mCompiling\e[0m new_debug_unreachable-1_0_6-6b7ba0743db86426"

      (set -x 
      ${rustc}/bin/rustc \
        --crate-name debug_unreachable \
        --edition=2021 src/lib.rs \
        --crate-type lib \
        --emit=dep-info,metadata,link \
        -C embed-bitcode=no \
        -C debuginfo=2 \
        ${rustc_arguments} \
        --check-cfg 'cfg(docsrs,test)' \
        --check-cfg 'cfg(feature, values())' \
        -C metadata=e84248e2e1921510 \
        -C extra-filename=-6b7ba0743db86426 \
        --out-dir $OUT_DIR \
        ${fn.rustc_linker_arguments passthru.rust_crate_libraries} \
        ${fn.rustc_propagated_arguments passthru.rust_script_build_run} \
        --cap-lints allow

      )
    '';
}
