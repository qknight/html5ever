# generated from rustc-call.nix.handlebars
{ fn, pkgs, rustc, cargo, lock_api-0_4_12-5446635aac5ff34d, parking_lot_core-0_9_10-4b67ff05bab6e753 }:
let
  rustc_arguments="";
in
  pkgs.stdenv.mkDerivation rec {
    name = "parking_lot-0_12_3-e1786befdffcd2a8";
    buildInputs = [];
    passthru.rust_crate_libraries = [lock_api-0_4_12-5446635aac5ff34d parking_lot_core-0_9_10-4b67ff05bab6e753];
    passthru.rust_crate_parent = [];
    passthru.rust_script_build_run = [];
    phases = "unpackPhase buildPhase";

    src = pkgs.fetchurl {
      url = "https://crates.io/api/v1/crates/parking_lot/0.12.3/download";
      sha256 = "f1bf18183cf54e8d6059647fc3063646a1801cf30896933ec2311622cc4b9a27";
    };
    unpackPhase = ''
      tar xf $src
      cd parking_lot-0.12.3
    '';

    RUSTC = "${rustc}/bin/rustc";
    CARGO = "${cargo}/bin/cargo";

    CARGO_CRATE_NAME = "parking_lot";
    CARGO_MANIFEST_DIR = "./";
    CARGO_MANIFEST_PATH = "./Cargo.toml";
    CARGO_PKG_AUTHORS = "Amanieu d'Antras <amanieu@gmail.com>";
    CARGO_PKG_DESCRIPTION = "More compact and efficient implementations of the standard synchronization primitives.";
    CARGO_PKG_HOMEPAGE = "";
    CARGO_PKG_LICENSE = "MIT OR Apache-2.0";
    CARGO_PKG_LICENSE_FILE = "";
    CARGO_PKG_NAME = "parking_lot";
    CARGO_PKG_README = "README.md";
    CARGO_PKG_REPOSITORY = "https://github.com/Amanieu/parking_lot";
    CARGO_PKG_RUST_VERSION = "1.56";
    CARGO_PKG_VERSION = "0.12.3";
    CARGO_PKG_VERSION_MAJOR = "0";
    CARGO_PKG_VERSION_MINOR = "12";
    CARGO_PKG_VERSION_PATCH = "3";
    CARGO_PKG_VERSION_PRE = "";

    buildPhase = ''
      export CARGO_MANIFEST_DIR=$(realpath $PWD/$CARGO_MANIFEST_DIR)
      export CARGO_MANIFEST_PATH=$(realpath $PWD/$CARGO_MANIFEST_PATH)

      mkdir -p $out
      export OUT_DIR=$out
      export INC_DIR=$(mktemp -d)

      echo -e "\e[92mCompiling\e[0m parking_lot-0_12_3-e1786befdffcd2a8"

      (set -x 
      ${rustc}/bin/rustc \
        --crate-name parking_lot \
        --edition=2021 src/lib.rs \
        --crate-type lib \
        --emit=dep-info,metadata,link \
        -C embed-bitcode=no \
        -C debuginfo=2 \
        ${rustc_arguments} \
        --cfg 'feature="default"' \
        --check-cfg 'cfg(docsrs,test)' \
        --check-cfg 'cfg(feature, values("arc_lock", "deadlock_detection", "default", "hardware-lock-elision", "nightly", "owning_ref", "send_guard", "serde"))' \
        -C metadata=9ec7c9ed41bad707 \
        -C extra-filename=-e1786befdffcd2a8 \
        --out-dir $OUT_DIR \
        ${fn.rustc_linker_arguments passthru.rust_crate_libraries} \
        ${fn.rustc_propagated_arguments passthru.rust_script_build_run} \
        --extern lock_api=${lock_api-0_4_12-5446635aac5ff34d}/liblock_api-5446635aac5ff34d.rmeta \
        --extern parking_lot_core=${parking_lot_core-0_9_10-4b67ff05bab6e753}/libparking_lot_core-4b67ff05bab6e753.rmeta \
        --cap-lints allow

      )
    '';
}
