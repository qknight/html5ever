# generated from rustc-call.nix.handlebars
{ fn, pkgs, rustc, cargo, parking_lot_core-0_9_10-script_build-0a31634d6df47fe2 }:
let
  rustc_arguments = fn.rustc_arguments parking_lot_core-0_9_10-script_build-0a31634d6df47fe2;
in
  pkgs.stdenv.mkDerivation rec {
    name = "parking_lot_core-0_9_10-script_build_run-afc754d01e5f222a";
    buildInputs = [];
    passthru.rust_crate_libraries = [];
    passthru.rust_crate_parent = [parking_lot_core-0_9_10-script_build-0a31634d6df47fe2];
    passthru.rust_script_build_run = [];
    phases = "unpackPhase buildPhase";

    src = pkgs.fetchurl {
      url = "https://crates.io/api/v1/crates/parking_lot_core/0.9.10/download";
      sha256 = "1e401f977ab385c9e4e3ab30627d6f26d00e2c73eef317493c4ec6d468726cf8";
    };
    unpackPhase = ''
      tar xf $src
      cd parking_lot_core-0.9.10
    '';

    RUSTC = "${rustc}/bin/rustc";
    CARGO = "${cargo}/bin/cargo";

    CARGO_CFG_FEATURE = "";
    CARGO_CFG_PANIC = "unwind";
    CARGO_CFG_TARGET_ABI = "";
    CARGO_CFG_TARGET_ARCH = "x86_64";
    CARGO_CFG_TARGET_ENDIAN = "little";
    CARGO_CFG_TARGET_ENV = "gnu";
    CARGO_CFG_TARGET_FAMILY = "unix";
    CARGO_CFG_TARGET_FEATURE = "fxsr,sse,sse2";
    CARGO_CFG_TARGET_HAS_ATOMIC = "16,32,64,8,ptr";
    CARGO_CFG_TARGET_OS = "linux";
    CARGO_CFG_TARGET_POINTER_WIDTH = "64";
    CARGO_CFG_TARGET_VENDOR = "unknown";
    CARGO_CFG_UNIX = "";
    CARGO_ENCODED_RUSTFLAGS = "";
    CARGO_MANIFEST_DIR = "./";
    CARGO_MANIFEST_PATH = "./Cargo.toml";
    CARGO_PKG_AUTHORS = "Amanieu d'Antras <amanieu@gmail.com>";
    CARGO_PKG_DESCRIPTION = "An advanced API for creating custom synchronization primitives.";
    CARGO_PKG_HOMEPAGE = "";
    CARGO_PKG_LICENSE = "MIT OR Apache-2.0";
    CARGO_PKG_LICENSE_FILE = "";
    CARGO_PKG_NAME = "parking_lot_core";
    CARGO_PKG_README = "";
    CARGO_PKG_REPOSITORY = "https://github.com/Amanieu/parking_lot";
    CARGO_PKG_RUST_VERSION = "1.56.0";
    CARGO_PKG_VERSION = "0.9.10";
    CARGO_PKG_VERSION_MAJOR = "0";
    CARGO_PKG_VERSION_MINOR = "9";
    CARGO_PKG_VERSION_PATCH = "10";
    CARGO_PKG_VERSION_PRE = "";
    DEBUG = "true";
    HOST = "x86_64-unknown-linux-gnu";
    NUM_JOBS = "16";
    OPT_LEVEL = "0";
    PROFILE = "debug";
    RUSTC_WORKSPACE_WRAPPER = "";
    RUSTC_WRAPPER = "";
    RUSTDOC = "rustdoc";
    RUSTFLAGS = "";
    TARGET = "x86_64-unknown-linux-gnu";

    buildPhase = ''
      export CARGO_MANIFEST_DIR=$(realpath $PWD/$CARGO_MANIFEST_DIR)
      export CARGO_MANIFEST_PATH=$(realpath $PWD/$CARGO_MANIFEST_PATH)

      mkdir -p $out
      export OUT_DIR=$out
      export INC_DIR=$(mktemp -d)

      echo -e "\e[92mCompiling\e[0m parking_lot_core-0_9_10-script_build_run-afc754d01e5f222a"
      if [ -f ${parking_lot_core-0_9_10-script_build-0a31634d6df47fe2}/environment-variables ]; then
          set -a
          source ${parking_lot_core-0_9_10-script_build-0a31634d6df47fe2}/environment-variables; 
          set +a
      fi
      if [ -f ${parking_lot_core-0_9_10-script_build-0a31634d6df47fe2}/environment-propagated-variables ]; then
          set -a
          echo -e "\033[38;5;208m$(cat ${parking_lot_core-0_9_10-script_build-0a31634d6df47fe2}/environment-propagated-variables)\033[0m"
          source ${parking_lot_core-0_9_10-script_build-0a31634d6df47fe2}/environment-propagated-variables;
          set +a
      fi
      for file in ${fn.environment_propagated_variables passthru.rust_script_build_run}; do
          if [ -f $file ]; then
              set -a
              echo -e "\033[38;5;208m$(cat $file)\033[0m"
              source $file
              set +a
          fi  
      done
      (set -x 
      ${parking_lot_core-0_9_10-script_build-0a31634d6df47fe2}/build_script_build > $OUT_DIR/build_script_build.out
      # the .out file could be empty
      cat $OUT_DIR/build_script_build.out | sort | uniq | grep -e '^cargo:' > $OUT_DIR/build_script_build.out_filtered || true
      ${pkgs.parse-build}/bin/cargo-build_script_build-parser $OUT_DIR/build_script_build.out_filtered environment-variables > $OUT_DIR/environment-variables
      ${pkgs.parse-build}/bin/cargo-build_script_build-parser $OUT_DIR/build_script_build.out_filtered environment-propagated-variables > $OUT_DIR/environment-propagated-variables
      ${pkgs.parse-build}/bin/cargo-build_script_build-parser $OUT_DIR/build_script_build.out_filtered rustc-arguments > $OUT_DIR/rustc-arguments
      ${pkgs.parse-build}/bin/cargo-build_script_build-parser $OUT_DIR/build_script_build.out_filtered rustc-propagated-arguments > $OUT_DIR/rustc-propagated-arguments

      )
    '';
}
