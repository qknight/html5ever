# generated from rustc-call.nix.handlebars
{ fn, pkgs, rustc, cargo }:
let
  rustc_arguments="";
in
  pkgs.stdenv.mkDerivation rec {
    name = "cfg-if-1_0_0-2b1095f2195c1f61";
    buildInputs = [];
    passthru.rust_crate_libraries = [];
    passthru.rust_crate_parent = [];
    passthru.rust_script_build_run = [];
    phases = "unpackPhase buildPhase";

    src = pkgs.fetchurl {
      url = "https://crates.io/api/v1/crates/cfg-if/1.0.0/download";
      sha256 = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd";
    };
    unpackPhase = ''
      tar xf $src
      cd cfg-if-1.0.0
    '';

    RUSTC = "${rustc}/bin/rustc";
    CARGO = "${cargo}/bin/cargo";

    CARGO_CRATE_NAME = "cfg_if";
    CARGO_MANIFEST_DIR = "./";
    CARGO_MANIFEST_PATH = "./Cargo.toml";
    CARGO_PKG_AUTHORS = "Alex Crichton <alex@alexcrichton.com>";
    CARGO_PKG_DESCRIPTION = "A macro to ergonomically define an item depending on a large number of #[cfg]
parameters. Structured like an if-else chain, the first matching branch is the
item that gets emitted.
";
    CARGO_PKG_HOMEPAGE = "https://github.com/alexcrichton/cfg-if";
    CARGO_PKG_LICENSE = "MIT/Apache-2.0";
    CARGO_PKG_LICENSE_FILE = "";
    CARGO_PKG_NAME = "cfg-if";
    CARGO_PKG_README = "README.md";
    CARGO_PKG_REPOSITORY = "https://github.com/alexcrichton/cfg-if";
    CARGO_PKG_RUST_VERSION = "";
    CARGO_PKG_VERSION = "1.0.0";
    CARGO_PKG_VERSION_MAJOR = "1";
    CARGO_PKG_VERSION_MINOR = "0";
    CARGO_PKG_VERSION_PATCH = "0";
    CARGO_PKG_VERSION_PRE = "";

    buildPhase = ''
      export CARGO_MANIFEST_DIR=$(realpath $PWD/$CARGO_MANIFEST_DIR)
      export CARGO_MANIFEST_PATH=$(realpath $PWD/$CARGO_MANIFEST_PATH)

      mkdir -p $out
      export OUT_DIR=$out
      export INC_DIR=$(mktemp -d)

      echo -e "\e[92mCompiling\e[0m cfg-if-1_0_0-2b1095f2195c1f61"

      (set -x 
      ${rustc}/bin/rustc \
        --crate-name cfg_if \
        --edition=2018 src/lib.rs \
        --crate-type lib \
        --emit=dep-info,metadata,link \
        -C embed-bitcode=no \
        -C debuginfo=2 \
        ${rustc_arguments} \
        --check-cfg 'cfg(docsrs,test)' \
        --check-cfg 'cfg(feature, values("compiler_builtins", "core", "rustc-dep-of-std"))' \
        -C metadata=c5d26a1e072ffb14 \
        -C extra-filename=-2b1095f2195c1f61 \
        --out-dir $OUT_DIR \
        ${fn.rustc_linker_arguments passthru.rust_crate_libraries} \
        ${fn.rustc_propagated_arguments passthru.rust_script_build_run} \
        --cap-lints allow

      )
    '';
}
