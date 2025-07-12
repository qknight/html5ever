# generated from rustc-call.nix.handlebars
{ fn, pkgs, rustc, cargo, lock_api-0_4_12-script_build-b58f30001d63f344 }:
let
  rustc_arguments = fn.rustc_arguments lock_api-0_4_12-script_build-b58f30001d63f344;
in
  pkgs.stdenv.mkDerivation rec {
    name = "lock_api-0_4_12-script_build_run-7484fdb636053cb2";
    buildInputs = [];
    passthru.rust_crate_libraries = [];
    passthru.rust_crate_parent = [lock_api-0_4_12-script_build-b58f30001d63f344];
    passthru.rust_script_build_run = [];
    phases = "unpackPhase buildPhase";

    src = pkgs.fetchurl {
      url = "https://crates.io/api/v1/crates/lock_api/0.4.12/download";
      sha256 = "07af8b9cdd281b7915f413fa73f29ebd5d55d0d3f0155584dade1ff18cea1b17";
    };
    unpackPhase = ''
      tar xf $src
      cd lock_api-0.4.12
    '';

    RUSTC = "${rustc}/bin/rustc";
    CARGO = "${cargo}/bin/cargo";

    CARGO_CFG_FEATURE = "atomic_usize,default";
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
    CARGO_FEATURE_ATOMIC_USIZE = "1";
    CARGO_FEATURE_DEFAULT = "1";
    CARGO_MANIFEST_DIR = "./";
    CARGO_MANIFEST_PATH = "./Cargo.toml";
    CARGO_PKG_AUTHORS = "Amanieu d'Antras <amanieu@gmail.com>";
    CARGO_PKG_DESCRIPTION = "Wrappers to create fully-featured Mutex and RwLock types. Compatible with no_std.";
    CARGO_PKG_HOMEPAGE = "";
    CARGO_PKG_LICENSE = "MIT OR Apache-2.0";
    CARGO_PKG_LICENSE_FILE = "";
    CARGO_PKG_NAME = "lock_api";
    CARGO_PKG_README = "";
    CARGO_PKG_REPOSITORY = "https://github.com/Amanieu/parking_lot";
    CARGO_PKG_RUST_VERSION = "1.56.0";
    CARGO_PKG_VERSION = "0.4.12";
    CARGO_PKG_VERSION_MAJOR = "0";
    CARGO_PKG_VERSION_MINOR = "4";
    CARGO_PKG_VERSION_PATCH = "12";
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

      echo -e "\e[92mCompiling\e[0m lock_api-0_4_12-script_build_run-7484fdb636053cb2"
      if [ -f ${lock_api-0_4_12-script_build-b58f30001d63f344}/environment-variables ]; then
          set -a
          source ${lock_api-0_4_12-script_build-b58f30001d63f344}/environment-variables; 
          set +a
      fi
      if [ -f ${lock_api-0_4_12-script_build-b58f30001d63f344}/environment-propagated-variables ]; then
          set -a
          echo -e "\033[38;5;208m$(cat ${lock_api-0_4_12-script_build-b58f30001d63f344}/environment-propagated-variables)\033[0m"
          source ${lock_api-0_4_12-script_build-b58f30001d63f344}/environment-propagated-variables;
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
      ${lock_api-0_4_12-script_build-b58f30001d63f344}/build_script_build > $OUT_DIR/build_script_build.out
      # the .out file could be empty
      cat $OUT_DIR/build_script_build.out | sort | uniq | grep -e '^cargo:' > $OUT_DIR/build_script_build.out_filtered || true
      ${pkgs.parse-build}/bin/cargo-build_script_build-parser $OUT_DIR/build_script_build.out_filtered environment-variables > $OUT_DIR/environment-variables
      ${pkgs.parse-build}/bin/cargo-build_script_build-parser $OUT_DIR/build_script_build.out_filtered environment-propagated-variables > $OUT_DIR/environment-propagated-variables
      ${pkgs.parse-build}/bin/cargo-build_script_build-parser $OUT_DIR/build_script_build.out_filtered rustc-arguments > $OUT_DIR/rustc-arguments
      ${pkgs.parse-build}/bin/cargo-build_script_build-parser $OUT_DIR/build_script_build.out_filtered rustc-propagated-arguments > $OUT_DIR/rustc-propagated-arguments

      )
    '';
}
