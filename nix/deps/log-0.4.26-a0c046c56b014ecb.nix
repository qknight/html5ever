# generated from rustc-call.nix.handlebars
{ fn, pkgs, rustc, cargo }:
let
  rustc_arguments="";
in
  pkgs.stdenv.mkDerivation rec {
    name = "log-0_4_26-a0c046c56b014ecb";
    buildInputs = [];
    passthru.rust_crate_libraries = [];
    passthru.rust_crate_parent = [];
    passthru.rust_script_build_run = [];
    phases = "unpackPhase buildPhase";

    src = pkgs.fetchurl {
      url = "https://crates.io/api/v1/crates/log/0.4.26/download";
      sha256 = "30bde2b3dc3671ae49d8e2e9f044c7c005836e7a023ee57cffa25ab82764bb9e";
    };
    unpackPhase = ''
      tar xf $src
      cd log-0.4.26
    '';

    RUSTC = "${rustc}/bin/rustc";
    CARGO = "${cargo}/bin/cargo";

    CARGO_CRATE_NAME = "log";
    CARGO_MANIFEST_DIR = "./";
    CARGO_MANIFEST_PATH = "./Cargo.toml";
    CARGO_PKG_AUTHORS = "The Rust Project Developers";
    CARGO_PKG_DESCRIPTION = "A lightweight logging facade for Rust
";
    CARGO_PKG_HOMEPAGE = "";
    CARGO_PKG_LICENSE = "MIT OR Apache-2.0";
    CARGO_PKG_LICENSE_FILE = "";
    CARGO_PKG_NAME = "log";
    CARGO_PKG_README = "README.md";
    CARGO_PKG_REPOSITORY = "https://github.com/rust-lang/log";
    CARGO_PKG_RUST_VERSION = "1.60.0";
    CARGO_PKG_VERSION = "0.4.26";
    CARGO_PKG_VERSION_MAJOR = "0";
    CARGO_PKG_VERSION_MINOR = "4";
    CARGO_PKG_VERSION_PATCH = "26";
    CARGO_PKG_VERSION_PRE = "";

    buildPhase = ''
      export CARGO_MANIFEST_DIR=$(realpath $PWD/$CARGO_MANIFEST_DIR)
      export CARGO_MANIFEST_PATH=$(realpath $PWD/$CARGO_MANIFEST_PATH)

      mkdir -p $out
      export OUT_DIR=$out
      export INC_DIR=$(mktemp -d)

      echo -e "\e[92mCompiling\e[0m log-0_4_26-a0c046c56b014ecb"

      (set -x 
      ${rustc}/bin/rustc \
        --crate-name log \
        --edition=2021 src/lib.rs \
        --crate-type lib \
        --emit=dep-info,metadata,link \
        -C embed-bitcode=no \
        -C debuginfo=2 \
        ${rustc_arguments} \
        --check-cfg 'cfg(docsrs,test)' \
        --check-cfg 'cfg(feature, values("kv", "kv_serde", "kv_std", "kv_sval", "kv_unstable", "kv_unstable_serde", "kv_unstable_std", "kv_unstable_sval", "max_level_debug", "max_level_error", "max_level_info", "max_level_off", "max_level_trace", "max_level_warn", "release_max_level_debug", "release_max_level_error", "release_max_level_info", "release_max_level_off", "release_max_level_trace", "release_max_level_warn", "serde", "std", "sval", "sval_ref", "value-bag"))' \
        -C metadata=3b0eef85bc379b4d \
        -C extra-filename=-a0c046c56b014ecb \
        --out-dir $OUT_DIR \
        ${fn.rustc_linker_arguments passthru.rust_crate_libraries} \
        ${fn.rustc_propagated_arguments passthru.rust_script_build_run} \
        --cap-lints allow

      )
    '';
}
