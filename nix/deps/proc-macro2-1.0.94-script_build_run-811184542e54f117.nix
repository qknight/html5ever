# generated from rustc-call.nix.handlebars
{ fn, pkgs, rustc, cargo, proc-macro2-1_0_94-script_build-0c3b9fcc96165103 }:
let
  rustc_arguments = fn.rustc_arguments proc-macro2-1_0_94-script_build-0c3b9fcc96165103;
in
  pkgs.stdenv.mkDerivation rec {
    name = "proc-macro2-1_0_94-script_build_run-811184542e54f117";
    buildInputs = [];
    passthru.rust_crate_libraries = [];
    passthru.rust_crate_parent = [proc-macro2-1_0_94-script_build-0c3b9fcc96165103];
    passthru.rust_script_build_run = [];
    phases = "unpackPhase buildPhase";

    src = pkgs.fetchurl {
      url = "https://crates.io/api/v1/crates/proc-macro2/1.0.94/download";
      sha256 = "a31971752e70b8b2686d7e46ec17fb38dad4051d94024c88df49b667caea9c84";
    };
    unpackPhase = ''
      tar xf $src
      cd proc-macro2-1.0.94
    '';

    RUSTC = "${rustc}/bin/rustc";
    CARGO = "${cargo}/bin/cargo";

    CARGO_CFG_FEATURE = "default,proc-macro";
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
    CARGO_FEATURE_PROC_MACRO = "1";
    CARGO_MANIFEST_DIR = "./";
    CARGO_MANIFEST_PATH = "./Cargo.toml";
    CARGO_PKG_AUTHORS = "David Tolnay <dtolnay@gmail.com>:Alex Crichton <alex@alexcrichton.com>";
    CARGO_PKG_DESCRIPTION = "A substitute implementation of the compiler's `proc_macro` API to decouple token-based libraries from the procedural macro use case.";
    CARGO_PKG_HOMEPAGE = "";
    CARGO_PKG_LICENSE = "MIT OR Apache-2.0";
    CARGO_PKG_LICENSE_FILE = "";
    CARGO_PKG_NAME = "proc-macro2";
    CARGO_PKG_README = "README.md";
    CARGO_PKG_REPOSITORY = "https://github.com/dtolnay/proc-macro2";
    CARGO_PKG_RUST_VERSION = "1.56";
    CARGO_PKG_VERSION = "1.0.94";
    CARGO_PKG_VERSION_MAJOR = "1";
    CARGO_PKG_VERSION_MINOR = "0";
    CARGO_PKG_VERSION_PATCH = "94";
    CARGO_PKG_VERSION_PRE = "";
    DEBUG = "false";
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

      echo -e "\e[92mCompiling\e[0m proc-macro2-1_0_94-script_build_run-811184542e54f117"
      if [ -f ${proc-macro2-1_0_94-script_build-0c3b9fcc96165103}/environment-variables ]; then
          set -a
          source ${proc-macro2-1_0_94-script_build-0c3b9fcc96165103}/environment-variables; 
          set +a
      fi
      if [ -f ${proc-macro2-1_0_94-script_build-0c3b9fcc96165103}/environment-propagated-variables ]; then
          set -a
          echo -e "\033[38;5;208m$(cat ${proc-macro2-1_0_94-script_build-0c3b9fcc96165103}/environment-propagated-variables)\033[0m"
          source ${proc-macro2-1_0_94-script_build-0c3b9fcc96165103}/environment-propagated-variables;
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
      ${proc-macro2-1_0_94-script_build-0c3b9fcc96165103}/build_script_build > $OUT_DIR/build_script_build.out
      # the .out file could be empty
      cat $OUT_DIR/build_script_build.out | sort | uniq | grep -e '^cargo:' > $OUT_DIR/build_script_build.out_filtered || true
      ${pkgs.parse-build}/bin/cargo-build_script_build-parser $OUT_DIR/build_script_build.out_filtered environment-variables > $OUT_DIR/environment-variables
      ${pkgs.parse-build}/bin/cargo-build_script_build-parser $OUT_DIR/build_script_build.out_filtered environment-propagated-variables > $OUT_DIR/environment-propagated-variables
      ${pkgs.parse-build}/bin/cargo-build_script_build-parser $OUT_DIR/build_script_build.out_filtered rustc-arguments > $OUT_DIR/rustc-arguments
      ${pkgs.parse-build}/bin/cargo-build_script_build-parser $OUT_DIR/build_script_build.out_filtered rustc-propagated-arguments > $OUT_DIR/rustc-propagated-arguments

      )
    '';
}
