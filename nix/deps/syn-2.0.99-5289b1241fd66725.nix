# generated from rustc-call.nix.handlebars
{ fn, pkgs, rustc, cargo, proc-macro2-1_0_94-c00d5f2e4566fe3d, quote-1_0_39-7726c3a92da25f8b, unicode-ident-1_0_18-5783d1ad3b24ccf6 }:
let
  rustc_arguments="";
in
  pkgs.stdenv.mkDerivation rec {
    name = "syn-2_0_99-5289b1241fd66725";
    buildInputs = [];
    passthru.rust_crate_libraries = [proc-macro2-1_0_94-c00d5f2e4566fe3d quote-1_0_39-7726c3a92da25f8b unicode-ident-1_0_18-5783d1ad3b24ccf6];
    passthru.rust_crate_parent = [];
    passthru.rust_script_build_run = [];
    phases = "unpackPhase buildPhase";

    src = pkgs.fetchurl {
      url = "https://crates.io/api/v1/crates/syn/2.0.99/download";
      sha256 = "e02e925281e18ffd9d640e234264753c43edc62d64b2d4cf898f1bc5e75f3fc2";
    };
    unpackPhase = ''
      tar xf $src
      cd syn-2.0.99
    '';

    RUSTC = "${rustc}/bin/rustc";
    CARGO = "${cargo}/bin/cargo";

    CARGO_CRATE_NAME = "syn";
    CARGO_MANIFEST_DIR = "./";
    CARGO_MANIFEST_PATH = "./Cargo.toml";
    CARGO_PKG_AUTHORS = "David Tolnay <dtolnay@gmail.com>";
    CARGO_PKG_DESCRIPTION = "Parser for Rust source code";
    CARGO_PKG_HOMEPAGE = "";
    CARGO_PKG_LICENSE = "MIT OR Apache-2.0";
    CARGO_PKG_LICENSE_FILE = "";
    CARGO_PKG_NAME = "syn";
    CARGO_PKG_README = "README.md";
    CARGO_PKG_REPOSITORY = "https://github.com/dtolnay/syn";
    CARGO_PKG_RUST_VERSION = "1.61";
    CARGO_PKG_VERSION = "2.0.99";
    CARGO_PKG_VERSION_MAJOR = "2";
    CARGO_PKG_VERSION_MINOR = "0";
    CARGO_PKG_VERSION_PATCH = "99";
    CARGO_PKG_VERSION_PRE = "";

    buildPhase = ''
      export CARGO_MANIFEST_DIR=$(realpath $PWD/$CARGO_MANIFEST_DIR)
      export CARGO_MANIFEST_PATH=$(realpath $PWD/$CARGO_MANIFEST_PATH)

      mkdir -p $out
      export OUT_DIR=$out
      export INC_DIR=$(mktemp -d)

      echo -e "\e[92mCompiling\e[0m syn-2_0_99-5289b1241fd66725"

      (set -x 
      ${rustc}/bin/rustc \
        --crate-name syn \
        --edition=2021 src/lib.rs \
        --crate-type lib \
        --emit=dep-info,metadata,link \
        -C embed-bitcode=no \
        ${rustc_arguments} \
        --cfg 'feature="clone-impls"' \
        --cfg 'feature="default"' \
        --cfg 'feature="derive"' \
        --cfg 'feature="full"' \
        --cfg 'feature="parsing"' \
        --cfg 'feature="printing"' \
        --cfg 'feature="proc-macro"' \
        --check-cfg 'cfg(docsrs,test)' \
        --check-cfg 'cfg(feature, values("clone-impls", "default", "derive", "extra-traits", "fold", "full", "parsing", "printing", "proc-macro", "test", "visit", "visit-mut"))' \
        -C metadata=c56e651616f1cb39 \
        -C extra-filename=-5289b1241fd66725 \
        --out-dir $OUT_DIR \
        ${fn.rustc_linker_arguments passthru.rust_crate_libraries} \
        ${fn.rustc_propagated_arguments passthru.rust_script_build_run} \
        --extern proc_macro2=${proc-macro2-1_0_94-c00d5f2e4566fe3d}/libproc_macro2-c00d5f2e4566fe3d.rmeta \
        --extern quote=${quote-1_0_39-7726c3a92da25f8b}/libquote-7726c3a92da25f8b.rmeta \
        --extern unicode_ident=${unicode-ident-1_0_18-5783d1ad3b24ccf6}/libunicode_ident-5783d1ad3b24ccf6.rmeta \
        --cap-lints allow

      )
    '';
}
