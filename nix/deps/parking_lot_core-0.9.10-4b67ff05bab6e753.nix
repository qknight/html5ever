# generated from rustc-call.nix.handlebars
{ fn, pkgs, rustc, cargo, cfg-if-1_0_0-2b1095f2195c1f61, libc-0_2_170-0c3f17427ebb6109, parking_lot_core-0_9_10-script_build_run-afc754d01e5f222a, smallvec-1_14_0-386c45f226217eee }:
let
  rustc_arguments = fn.rustc_arguments parking_lot_core-0_9_10-script_build_run-afc754d01e5f222a;
in
  pkgs.stdenv.mkDerivation rec {
    name = "parking_lot_core-0_9_10-4b67ff05bab6e753";
    buildInputs = [];
    passthru.rust_crate_libraries = [cfg-if-1_0_0-2b1095f2195c1f61 libc-0_2_170-0c3f17427ebb6109 smallvec-1_14_0-386c45f226217eee];
    passthru.rust_crate_parent = [parking_lot_core-0_9_10-script_build_run-afc754d01e5f222a];
    passthru.rust_script_build_run = [parking_lot_core-0_9_10-script_build_run-afc754d01e5f222a];
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

    CARGO_CRATE_NAME = "parking_lot_core";
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

    buildPhase = ''
      export CARGO_MANIFEST_DIR=$(realpath $PWD/$CARGO_MANIFEST_DIR)
      export CARGO_MANIFEST_PATH=$(realpath $PWD/$CARGO_MANIFEST_PATH)

      mkdir -p $out
      export OUT_DIR=$out
      export INC_DIR=$(mktemp -d)

      echo -e "\e[92mCompiling\e[0m parking_lot_core-0_9_10-4b67ff05bab6e753"
      cp -r ${parking_lot_core-0_9_10-script_build_run-afc754d01e5f222a}/* $OUT_DIR
      for file in $out/environment-variables $out/environment-propagated-variables $out/rustc-arguments $out/rustc-propagated-arguments; do
          if [ -f "$file" ]; then
              sed -i "s|${parking_lot_core-0_9_10-script_build_run-afc754d01e5f222a}|$out|g" "$file"
          fi
      done
      if [ -f ${parking_lot_core-0_9_10-script_build_run-afc754d01e5f222a}/environment-variables ]; then
          set -a
          source ${parking_lot_core-0_9_10-script_build_run-afc754d01e5f222a}/environment-variables; 
          set +a
      fi
      if [ -f ${parking_lot_core-0_9_10-script_build_run-afc754d01e5f222a}/environment-propagated-variables ]; then
          set -a
          echo -e "\033[38;5;208m$(cat ${parking_lot_core-0_9_10-script_build_run-afc754d01e5f222a}/environment-propagated-variables)\033[0m"
          source ${parking_lot_core-0_9_10-script_build_run-afc754d01e5f222a}/environment-propagated-variables;
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
      ${rustc}/bin/rustc \
        --crate-name parking_lot_core \
        --edition=2021 src/lib.rs \
        --crate-type lib \
        --emit=dep-info,metadata,link \
        -C embed-bitcode=no \
        -C debuginfo=2 \
        ${rustc_arguments} \
        --check-cfg 'cfg(docsrs,test)' \
        --check-cfg 'cfg(feature, values("backtrace", "deadlock_detection", "nightly", "petgraph", "thread-id"))' \
        -C metadata=bfc8b31db6131626 \
        -C extra-filename=-4b67ff05bab6e753 \
        --out-dir $OUT_DIR \
        ${fn.rustc_linker_arguments passthru.rust_crate_libraries} \
        ${fn.rustc_propagated_arguments passthru.rust_script_build_run} \
        --extern cfg_if=${cfg-if-1_0_0-2b1095f2195c1f61}/libcfg_if-2b1095f2195c1f61.rmeta \
        --extern libc=${libc-0_2_170-0c3f17427ebb6109}/liblibc-0c3f17427ebb6109.rmeta \
        --extern smallvec=${smallvec-1_14_0-386c45f226217eee}/libsmallvec-386c45f226217eee.rmeta \
        --cap-lints allow

      )
    '';
}
