# generated from rustc-call.nix.handlebars
{ fn, pkgs, rustc, cargo, autocfg-1_4_0-33a18d854aead0c6 }:
let
  rustc_arguments="";
in
  pkgs.stdenv.mkDerivation rec {
    name = "lock_api-0_4_12-script_build-b58f30001d63f344";
    buildInputs = [];
    passthru.rust_crate_libraries = [autocfg-1_4_0-33a18d854aead0c6];
    passthru.rust_crate_parent = [];
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

    CARGO_CRATE_NAME = "build_script_build";
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

      echo -e "\e[92mCompiling\e[0m lock_api-0_4_12-script_build-b58f30001d63f344"

      (set -x 
      ${rustc}/bin/rustc \
        --crate-name build_script_build \
        --edition=2021 build.rs \
        --crate-type bin \
        --emit=dep-info,link \
        -C embed-bitcode=no \
        ${rustc_arguments} \
        --cfg 'feature="atomic_usize"' \
        --cfg 'feature="default"' \
        --check-cfg 'cfg(docsrs,test)' \
        --check-cfg 'cfg(feature, values("arc_lock", "atomic_usize", "default", "nightly", "owning_ref", "serde"))' \
        -C metadata=98fac6e6f4c7d02a \
        -C extra-filename=-b58f30001d63f344 \
        --out-dir $OUT_DIR \
        ${fn.rustc_linker_arguments passthru.rust_crate_libraries} \
        ${fn.rustc_propagated_arguments passthru.rust_script_build_run} \
        --extern autocfg=${autocfg-1_4_0-33a18d854aead0c6}/libautocfg-33a18d854aead0c6.rlib \
        --cap-lints allow
      ln -s $OUT_DIR/"$CARGO_CRATE_NAME"-b58f30001d63f344 $OUT_DIR/build_script_build
      )
    '';
}
