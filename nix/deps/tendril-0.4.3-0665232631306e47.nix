# generated from rustc-call.nix.handlebars
{ fn, pkgs, rustc, cargo, futf-0_1_5-8183acd663cd8e61, mac-0_1_1-f72a0f1a8d81125b, utf-8-0_7_6-c2c1c2b0d1dc1271 }:
let
  rustc_arguments="";
in
  pkgs.stdenv.mkDerivation rec {
    name = "tendril-0_4_3-0665232631306e47";
    buildInputs = [];
    passthru.rust_crate_libraries = [futf-0_1_5-8183acd663cd8e61 mac-0_1_1-f72a0f1a8d81125b utf-8-0_7_6-c2c1c2b0d1dc1271];
    passthru.rust_crate_parent = [];
    passthru.rust_script_build_run = [];
    phases = "unpackPhase buildPhase";

    src = pkgs.fetchurl {
      url = "https://crates.io/api/v1/crates/tendril/0.4.3/download";
      sha256 = "d24a120c5fc464a3458240ee02c299ebcb9d67b5249c8848b09d639dca8d7bb0";
    };
    unpackPhase = ''
      tar xf $src
      cd tendril-0.4.3
    '';

    RUSTC = "${rustc}/bin/rustc";
    CARGO = "${cargo}/bin/cargo";

    CARGO_CRATE_NAME = "tendril";
    CARGO_MANIFEST_DIR = "./";
    CARGO_MANIFEST_PATH = "./Cargo.toml";
    CARGO_PKG_AUTHORS = "Keegan McAllister <mcallister.keegan@gmail.com>:Simon Sapin <simon.sapin@exyr.org>:Chris Morgan <me@chrismorgan.info>";
    CARGO_PKG_DESCRIPTION = "Compact buffer/string type for zero-copy parsing";
    CARGO_PKG_HOMEPAGE = "";
    CARGO_PKG_LICENSE = "MIT/Apache-2.0";
    CARGO_PKG_LICENSE_FILE = "";
    CARGO_PKG_NAME = "tendril";
    CARGO_PKG_README = "README.md";
    CARGO_PKG_REPOSITORY = "https://github.com/servo/tendril";
    CARGO_PKG_RUST_VERSION = "";
    CARGO_PKG_VERSION = "0.4.3";
    CARGO_PKG_VERSION_MAJOR = "0";
    CARGO_PKG_VERSION_MINOR = "4";
    CARGO_PKG_VERSION_PATCH = "3";
    CARGO_PKG_VERSION_PRE = "";

    buildPhase = ''
      export CARGO_MANIFEST_DIR=$(realpath $PWD/$CARGO_MANIFEST_DIR)
      export CARGO_MANIFEST_PATH=$(realpath $PWD/$CARGO_MANIFEST_PATH)

      mkdir -p $out
      export OUT_DIR=$out
      export INC_DIR=$(mktemp -d)

      echo -e "\e[92mCompiling\e[0m tendril-0_4_3-0665232631306e47"

      (set -x 
      ${rustc}/bin/rustc \
        --crate-name tendril \
        --edition=2015 src/lib.rs \
        --crate-type lib \
        --emit=dep-info,metadata,link \
        -C embed-bitcode=no \
        -C debuginfo=2 \
        ${rustc_arguments} \
        --check-cfg 'cfg(docsrs,test)' \
        --check-cfg 'cfg(feature, values("bench", "encoding", "encoding_rs"))' \
        -C metadata=03f3962beccaf998 \
        -C extra-filename=-0665232631306e47 \
        --out-dir $OUT_DIR \
        ${fn.rustc_linker_arguments passthru.rust_crate_libraries} \
        ${fn.rustc_propagated_arguments passthru.rust_script_build_run} \
        --extern futf=${futf-0_1_5-8183acd663cd8e61}/libfutf-8183acd663cd8e61.rmeta \
        --extern mac=${mac-0_1_1-f72a0f1a8d81125b}/libmac-f72a0f1a8d81125b.rmeta \
        --extern utf8=${utf-8-0_7_6-c2c1c2b0d1dc1271}/libutf8-c2c1c2b0d1dc1271.rmeta \
        --cap-lints allow

      )
    '';
}
