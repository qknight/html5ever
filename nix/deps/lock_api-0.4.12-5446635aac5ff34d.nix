# generated from rustc-call.nix.handlebars
{ fn, pkgs, rustc, cargo, lock_api-0_4_12-script_build_run-7484fdb636053cb2, scopeguard-1_2_0-faaabf9a734bce39 }:
let
  rustc_arguments = fn.rustc_arguments lock_api-0_4_12-script_build_run-7484fdb636053cb2;
in
  pkgs.stdenv.mkDerivation rec {
    name = "lock_api-0_4_12-5446635aac5ff34d";
    buildInputs = [];
    passthru.rust_crate_libraries = [scopeguard-1_2_0-faaabf9a734bce39];
    passthru.rust_crate_parent = [lock_api-0_4_12-script_build_run-7484fdb636053cb2];
    passthru.rust_script_build_run = [lock_api-0_4_12-script_build_run-7484fdb636053cb2];
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

    CARGO_CRATE_NAME = "lock_api";
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

    buildPhase = ''
      export CARGO_MANIFEST_DIR=$(realpath $PWD/$CARGO_MANIFEST_DIR)
      export CARGO_MANIFEST_PATH=$(realpath $PWD/$CARGO_MANIFEST_PATH)

      mkdir -p $out
      export OUT_DIR=$out
      export INC_DIR=$(mktemp -d)

      echo -e "\e[92mCompiling\e[0m lock_api-0_4_12-5446635aac5ff34d"
      cp -r ${lock_api-0_4_12-script_build_run-7484fdb636053cb2}/* $OUT_DIR
      for file in $out/environment-variables $out/environment-propagated-variables $out/rustc-arguments $out/rustc-propagated-arguments; do
          if [ -f "$file" ]; then
              sed -i "s|${lock_api-0_4_12-script_build_run-7484fdb636053cb2}|$out|g" "$file"
          fi
      done
      if [ -f ${lock_api-0_4_12-script_build_run-7484fdb636053cb2}/environment-variables ]; then
          set -a
          source ${lock_api-0_4_12-script_build_run-7484fdb636053cb2}/environment-variables; 
          set +a
      fi
      if [ -f ${lock_api-0_4_12-script_build_run-7484fdb636053cb2}/environment-propagated-variables ]; then
          set -a
          echo -e "\033[38;5;208m$(cat ${lock_api-0_4_12-script_build_run-7484fdb636053cb2}/environment-propagated-variables)\033[0m"
          source ${lock_api-0_4_12-script_build_run-7484fdb636053cb2}/environment-propagated-variables;
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
        --crate-name lock_api \
        --edition=2021 src/lib.rs \
        --crate-type lib \
        --emit=dep-info,metadata,link \
        -C embed-bitcode=no \
        -C debuginfo=2 \
        ${rustc_arguments} \
        --cfg 'feature="atomic_usize"' \
        --cfg 'feature="default"' \
        --check-cfg 'cfg(docsrs,test)' \
        --check-cfg 'cfg(feature, values("arc_lock", "atomic_usize", "default", "nightly", "owning_ref", "serde"))' \
        -C metadata=24a451d43e84e0ca \
        -C extra-filename=-5446635aac5ff34d \
        --out-dir $OUT_DIR \
        ${fn.rustc_linker_arguments passthru.rust_crate_libraries} \
        ${fn.rustc_propagated_arguments passthru.rust_script_build_run} \
        --extern scopeguard=${scopeguard-1_2_0-faaabf9a734bce39}/libscopeguard-faaabf9a734bce39.rmeta \
        --cap-lints allow

      )
    '';
}
