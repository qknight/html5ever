# generated from rustc-call.nix.handlebars
{ fn, pkgs, rustc, cargo, serde-1_0_218-script_build-6e5c408cc517c124 }:
let
  rustc_arguments = fn.rustc_arguments serde-1_0_218-script_build-6e5c408cc517c124;
in
  pkgs.stdenv.mkDerivation rec {
    name = "serde-1_0_218-script_build_run-679977d4f26d90fb";
    buildInputs = [];
    passthru.rust_crate_libraries = [];
    passthru.rust_crate_parent = [serde-1_0_218-script_build-6e5c408cc517c124];
    passthru.rust_script_build_run = [];
    phases = "unpackPhase buildPhase";

    src = pkgs.fetchurl {
      url = "https://crates.io/api/v1/crates/serde/1.0.218/download";
      sha256 = "e8dfc9d19bdbf6d17e22319da49161d5d0108e4188e8b680aef6299eed22df60";
    };
    unpackPhase = ''
      tar xf $src
      cd serde-1.0.218
    '';

    RUSTC = "${rustc}/bin/rustc";
    CARGO = "${cargo}/bin/cargo";

    CARGO_CFG_FEATURE = "default,std";
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
    CARGO_FEATURE_DEFAULT = "1";
    CARGO_FEATURE_STD = "1";
    CARGO_MANIFEST_DIR = "./";
    CARGO_MANIFEST_PATH = "./Cargo.toml";
    CARGO_PKG_AUTHORS = "Erick Tryzelaar <erick.tryzelaar@gmail.com>:David Tolnay <dtolnay@gmail.com>";
    CARGO_PKG_DESCRIPTION = "A generic serialization/deserialization framework";
    CARGO_PKG_HOMEPAGE = "https://serde.rs";
    CARGO_PKG_LICENSE = "MIT OR Apache-2.0";
    CARGO_PKG_LICENSE_FILE = "";
    CARGO_PKG_NAME = "serde";
    CARGO_PKG_README = "crates-io.md";
    CARGO_PKG_REPOSITORY = "https://github.com/serde-rs/serde";
    CARGO_PKG_RUST_VERSION = "1.31";
    CARGO_PKG_VERSION = "1.0.218";
    CARGO_PKG_VERSION_MAJOR = "1";
    CARGO_PKG_VERSION_MINOR = "0";
    CARGO_PKG_VERSION_PATCH = "218";
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

      echo -e "\e[92mCompiling\e[0m serde-1_0_218-script_build_run-679977d4f26d90fb"
      if [ -f ${serde-1_0_218-script_build-6e5c408cc517c124}/environment-variables ]; then
          set -a
          source ${serde-1_0_218-script_build-6e5c408cc517c124}/environment-variables; 
          set +a
      fi
      if [ -f ${serde-1_0_218-script_build-6e5c408cc517c124}/environment-propagated-variables ]; then
          set -a
          echo -e "\033[38;5;208m$(cat ${serde-1_0_218-script_build-6e5c408cc517c124}/environment-propagated-variables)\033[0m"
          source ${serde-1_0_218-script_build-6e5c408cc517c124}/environment-propagated-variables;
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
      ${serde-1_0_218-script_build-6e5c408cc517c124}/build_script_build > $OUT_DIR/build_script_build.out
      # the .out file could be empty
      cat $OUT_DIR/build_script_build.out | sort | uniq | grep -e '^cargo:' > $OUT_DIR/build_script_build.out_filtered || true
      ${pkgs.parse-build}/bin/cargo-build_script_build-parser $OUT_DIR/build_script_build.out_filtered environment-variables > $OUT_DIR/environment-variables
      ${pkgs.parse-build}/bin/cargo-build_script_build-parser $OUT_DIR/build_script_build.out_filtered environment-propagated-variables > $OUT_DIR/environment-propagated-variables
      ${pkgs.parse-build}/bin/cargo-build_script_build-parser $OUT_DIR/build_script_build.out_filtered rustc-arguments > $OUT_DIR/rustc-arguments
      ${pkgs.parse-build}/bin/cargo-build_script_build-parser $OUT_DIR/build_script_build.out_filtered rustc-propagated-arguments > $OUT_DIR/rustc-propagated-arguments

      )
    '';
}
