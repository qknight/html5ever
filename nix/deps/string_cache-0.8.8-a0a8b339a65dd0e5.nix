# generated from rustc-call.nix.handlebars
{ fn, pkgs, rustc, cargo, new_debug_unreachable-1_0_6-6b7ba0743db86426, parking_lot-0_12_3-e1786befdffcd2a8, phf_shared-0_11_3-ec50c9c17879817d, precomputed-hash-0_1_1-89bfd43691c36a5a, serde-1_0_218-60d80c2d94243f7d }:
let
  rustc_arguments="";
in
  pkgs.stdenv.mkDerivation rec {
    name = "string_cache-0_8_8-a0a8b339a65dd0e5";
    buildInputs = [];
    passthru.rust_crate_libraries = [new_debug_unreachable-1_0_6-6b7ba0743db86426 parking_lot-0_12_3-e1786befdffcd2a8 phf_shared-0_11_3-ec50c9c17879817d precomputed-hash-0_1_1-89bfd43691c36a5a serde-1_0_218-60d80c2d94243f7d];
    passthru.rust_crate_parent = [];
    passthru.rust_script_build_run = [];
    phases = "unpackPhase buildPhase";

    src = pkgs.fetchurl {
      url = "https://crates.io/api/v1/crates/string_cache/0.8.8/download";
      sha256 = "938d512196766101d333398efde81bc1f37b00cb42c2f8350e5df639f040bbbe";
    };
    unpackPhase = ''
      tar xf $src
      cd string_cache-0.8.8
    '';

    RUSTC = "${rustc}/bin/rustc";
    CARGO = "${cargo}/bin/cargo";

    CARGO_CRATE_NAME = "string_cache";
    CARGO_MANIFEST_DIR = "./";
    CARGO_MANIFEST_PATH = "./Cargo.toml";
    CARGO_PKG_AUTHORS = "The Servo Project Developers";
    CARGO_PKG_DESCRIPTION = "A string interning library for Rust, developed as part of the Servo project.";
    CARGO_PKG_HOMEPAGE = "";
    CARGO_PKG_LICENSE = "MIT OR Apache-2.0";
    CARGO_PKG_LICENSE_FILE = "";
    CARGO_PKG_NAME = "string_cache";
    CARGO_PKG_README = "README.md";
    CARGO_PKG_REPOSITORY = "https://github.com/servo/string-cache";
    CARGO_PKG_RUST_VERSION = "";
    CARGO_PKG_VERSION = "0.8.8";
    CARGO_PKG_VERSION_MAJOR = "0";
    CARGO_PKG_VERSION_MINOR = "8";
    CARGO_PKG_VERSION_PATCH = "8";
    CARGO_PKG_VERSION_PRE = "";

    buildPhase = ''
      export CARGO_MANIFEST_DIR=$(realpath $PWD/$CARGO_MANIFEST_DIR)
      export CARGO_MANIFEST_PATH=$(realpath $PWD/$CARGO_MANIFEST_PATH)

      mkdir -p $out
      export OUT_DIR=$out
      export INC_DIR=$(mktemp -d)

      echo -e "\e[92mCompiling\e[0m string_cache-0_8_8-a0a8b339a65dd0e5"

      (set -x 
      ${rustc}/bin/rustc \
        --crate-name string_cache \
        --edition=2018 src/lib.rs \
        --crate-type lib \
        --emit=dep-info,metadata,link \
        -C embed-bitcode=no \
        -C debuginfo=2 \
        ${rustc_arguments} \
        --cfg 'feature="default"' \
        --cfg 'feature="serde"' \
        --cfg 'feature="serde_support"' \
        --check-cfg 'cfg(docsrs,test)' \
        --check-cfg 'cfg(feature, values("default", "serde", "serde_support"))' \
        -C metadata=80fe13bc6e95723f \
        -C extra-filename=-a0a8b339a65dd0e5 \
        --out-dir $OUT_DIR \
        ${fn.rustc_linker_arguments passthru.rust_crate_libraries} \
        ${fn.rustc_propagated_arguments passthru.rust_script_build_run} \
        --extern debug_unreachable=${new_debug_unreachable-1_0_6-6b7ba0743db86426}/libdebug_unreachable-6b7ba0743db86426.rmeta \
        --extern parking_lot=${parking_lot-0_12_3-e1786befdffcd2a8}/libparking_lot-e1786befdffcd2a8.rmeta \
        --extern phf_shared=${phf_shared-0_11_3-ec50c9c17879817d}/libphf_shared-ec50c9c17879817d.rmeta \
        --extern precomputed_hash=${precomputed-hash-0_1_1-89bfd43691c36a5a}/libprecomputed_hash-89bfd43691c36a5a.rmeta \
        --extern serde=${serde-1_0_218-60d80c2d94243f7d}/libserde-60d80c2d94243f7d.rmeta \
        --cap-lints allow

      )
    '';
}
