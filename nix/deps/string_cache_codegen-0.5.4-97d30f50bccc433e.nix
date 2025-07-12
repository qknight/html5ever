# generated from rustc-call.nix.handlebars
{ fn, pkgs, rustc, cargo, phf_generator-0_11_3-c688b166d2afc894, phf_shared-0_11_3-ec50c9c17879817d, proc-macro2-1_0_94-c00d5f2e4566fe3d, quote-1_0_39-7726c3a92da25f8b }:
let
  rustc_arguments="";
in
  pkgs.stdenv.mkDerivation rec {
    name = "string_cache_codegen-0_5_4-97d30f50bccc433e";
    buildInputs = [];
    passthru.rust_crate_libraries = [phf_generator-0_11_3-c688b166d2afc894 phf_shared-0_11_3-ec50c9c17879817d proc-macro2-1_0_94-c00d5f2e4566fe3d quote-1_0_39-7726c3a92da25f8b];
    passthru.rust_crate_parent = [];
    passthru.rust_script_build_run = [];
    phases = "unpackPhase buildPhase";

    src = pkgs.fetchurl {
      url = "https://crates.io/api/v1/crates/string_cache_codegen/0.5.4/download";
      sha256 = "c711928715f1fe0fe509c53b43e993a9a557babc2d0a3567d0a3006f1ac931a0";
    };
    unpackPhase = ''
      tar xf $src
      cd string_cache_codegen-0.5.4
    '';

    RUSTC = "${rustc}/bin/rustc";
    CARGO = "${cargo}/bin/cargo";

    CARGO_CRATE_NAME = "string_cache_codegen";
    CARGO_MANIFEST_DIR = "./";
    CARGO_MANIFEST_PATH = "./Cargo.toml";
    CARGO_PKG_AUTHORS = "The Servo Project Developers";
    CARGO_PKG_DESCRIPTION = "A codegen library for string-cache, developed as part of the Servo project.";
    CARGO_PKG_HOMEPAGE = "";
    CARGO_PKG_LICENSE = "MIT OR Apache-2.0";
    CARGO_PKG_LICENSE_FILE = "";
    CARGO_PKG_NAME = "string_cache_codegen";
    CARGO_PKG_README = "";
    CARGO_PKG_REPOSITORY = "https://github.com/servo/string-cache";
    CARGO_PKG_RUST_VERSION = "";
    CARGO_PKG_VERSION = "0.5.4";
    CARGO_PKG_VERSION_MAJOR = "0";
    CARGO_PKG_VERSION_MINOR = "5";
    CARGO_PKG_VERSION_PATCH = "4";
    CARGO_PKG_VERSION_PRE = "";

    buildPhase = ''
      export CARGO_MANIFEST_DIR=$(realpath $PWD/$CARGO_MANIFEST_DIR)
      export CARGO_MANIFEST_PATH=$(realpath $PWD/$CARGO_MANIFEST_PATH)

      mkdir -p $out
      export OUT_DIR=$out
      export INC_DIR=$(mktemp -d)

      echo -e "\e[92mCompiling\e[0m string_cache_codegen-0_5_4-97d30f50bccc433e"

      (set -x 
      ${rustc}/bin/rustc \
        --crate-name string_cache_codegen \
        --edition=2018 lib.rs \
        --crate-type lib \
        --emit=dep-info,metadata,link \
        -C embed-bitcode=no \
        ${rustc_arguments} \
        --check-cfg 'cfg(docsrs,test)' \
        --check-cfg 'cfg(feature, values())' \
        -C metadata=f657fa24c789f7b7 \
        -C extra-filename=-97d30f50bccc433e \
        --out-dir $OUT_DIR \
        ${fn.rustc_linker_arguments passthru.rust_crate_libraries} \
        ${fn.rustc_propagated_arguments passthru.rust_script_build_run} \
        --extern phf_generator=${phf_generator-0_11_3-c688b166d2afc894}/libphf_generator-c688b166d2afc894.rmeta \
        --extern phf_shared=${phf_shared-0_11_3-ec50c9c17879817d}/libphf_shared-ec50c9c17879817d.rmeta \
        --extern proc_macro2=${proc-macro2-1_0_94-c00d5f2e4566fe3d}/libproc_macro2-c00d5f2e4566fe3d.rmeta \
        --extern quote=${quote-1_0_39-7726c3a92da25f8b}/libquote-7726c3a92da25f8b.rmeta \
        --cap-lints allow

      )
    '';
}
