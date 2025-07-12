# generated from rustc-call.nix.handlebars
{ fn, pkgs, rustc, cargo, markup5ever-0_14_2-script_build-98d3ca65d550ea9a }:
let
  rustc_arguments = fn.rustc_arguments markup5ever-0_14_2-script_build-98d3ca65d550ea9a;
in
  pkgs.stdenv.mkDerivation rec {
    name = "markup5ever-0_14_2-script_build_run-7378ee86ff42466a";
    buildInputs = [];
    passthru.rust_crate_libraries = [];
    passthru.rust_crate_parent = [markup5ever-0_14_2-script_build-98d3ca65d550ea9a];
    passthru.rust_script_build_run = [];
    phases = "unpackPhase buildPhase";

    src = builtins.filterSource
      (path: type:
        let base = baseNameOf path;
        in !(base == "target" || base == "result" || builtins.match "result-*" base != null)
      ) /home/nixos/html5ever;
    unpackPhase = "";

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
    CARGO_MANIFEST_DIR = "./markup5ever";
    CARGO_MANIFEST_PATH = "./markup5ever/Cargo.toml";
    CARGO_PKG_AUTHORS = "The html5ever Project Developers";
    CARGO_PKG_DESCRIPTION = "Common code for xml5ever and html5ever";
    CARGO_PKG_HOMEPAGE = "";
    CARGO_PKG_LICENSE = "MIT OR Apache-2.0";
    CARGO_PKG_LICENSE_FILE = "";
    CARGO_PKG_NAME = "markup5ever";
    CARGO_PKG_README = "";
    CARGO_PKG_REPOSITORY = "https://github.com/servo/html5ever";
    CARGO_PKG_RUST_VERSION = "1.70.0";
    CARGO_PKG_VERSION = "0.14.2";
    CARGO_PKG_VERSION_MAJOR = "0";
    CARGO_PKG_VERSION_MINOR = "14";
    CARGO_PKG_VERSION_PATCH = "2";
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

      echo -e "\e[92mCompiling\e[0m markup5ever-0_14_2-script_build_run-7378ee86ff42466a"
      if [ -f ${markup5ever-0_14_2-script_build-98d3ca65d550ea9a}/environment-variables ]; then
          set -a
          source ${markup5ever-0_14_2-script_build-98d3ca65d550ea9a}/environment-variables; 
          set +a
      fi
      if [ -f ${markup5ever-0_14_2-script_build-98d3ca65d550ea9a}/environment-propagated-variables ]; then
          set -a
          echo -e "\033[38;5;208m$(cat ${markup5ever-0_14_2-script_build-98d3ca65d550ea9a}/environment-propagated-variables)\033[0m"
          source ${markup5ever-0_14_2-script_build-98d3ca65d550ea9a}/environment-propagated-variables;
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
      ${markup5ever-0_14_2-script_build-98d3ca65d550ea9a}/build_script_build > $OUT_DIR/build_script_build.out
      # the .out file could be empty
      cat $OUT_DIR/build_script_build.out | sort | uniq | grep -e '^cargo:' > $OUT_DIR/build_script_build.out_filtered || true
      ${pkgs.parse-build}/bin/cargo-build_script_build-parser $OUT_DIR/build_script_build.out_filtered environment-variables > $OUT_DIR/environment-variables
      ${pkgs.parse-build}/bin/cargo-build_script_build-parser $OUT_DIR/build_script_build.out_filtered environment-propagated-variables > $OUT_DIR/environment-propagated-variables
      ${pkgs.parse-build}/bin/cargo-build_script_build-parser $OUT_DIR/build_script_build.out_filtered rustc-arguments > $OUT_DIR/rustc-arguments
      ${pkgs.parse-build}/bin/cargo-build_script_build-parser $OUT_DIR/build_script_build.out_filtered rustc-propagated-arguments > $OUT_DIR/rustc-propagated-arguments

      )
    '';
}
