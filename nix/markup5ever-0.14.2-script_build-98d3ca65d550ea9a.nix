# generated from rustc-call.nix.handlebars
{ fn, pkgs, rustc, cargo, phf_codegen-0_11_3-f8ffd13b9a34c4ec, string_cache_codegen-0_5_4-97d30f50bccc433e }:
let
  rustc_arguments="";
in
  pkgs.stdenv.mkDerivation rec {
    name = "markup5ever-0_14_2-script_build-98d3ca65d550ea9a";
    buildInputs = [];
    passthru.rust_crate_libraries = [phf_codegen-0_11_3-f8ffd13b9a34c4ec string_cache_codegen-0_5_4-97d30f50bccc433e];
    passthru.rust_crate_parent = [];
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

    CARGO_CRATE_NAME = "build_script_build";
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
    CARGO_PRIMARY_PACKAGE = "1";
    CARGO_SBOM_PATH = "";

    buildPhase = ''
      export CARGO_MANIFEST_DIR=$(realpath $PWD/$CARGO_MANIFEST_DIR)
      export CARGO_MANIFEST_PATH=$(realpath $PWD/$CARGO_MANIFEST_PATH)

      mkdir -p $out
      export OUT_DIR=$out
      export INC_DIR=$(mktemp -d)

      echo -e "\e[92mCompiling\e[0m markup5ever-0_14_2-script_build-98d3ca65d550ea9a"

      (set -x 
      ${rustc}/bin/rustc \
        --crate-name build_script_build \
        --edition=2021 markup5ever/build.rs \
        --crate-type bin \
        --emit=dep-info,link \
        -C embed-bitcode=no \
        ${rustc_arguments} \
        --check-cfg 'cfg(docsrs,test)' \
        --check-cfg 'cfg(feature, values())' \
        -C metadata=c90825a370126012 \
        -C extra-filename=-98d3ca65d550ea9a \
        --out-dir $OUT_DIR \
        ${fn.rustc_linker_arguments passthru.rust_crate_libraries} \
        ${fn.rustc_propagated_arguments passthru.rust_script_build_run} \
        --extern phf_codegen=${phf_codegen-0_11_3-f8ffd13b9a34c4ec}/libphf_codegen-f8ffd13b9a34c4ec.rlib \
        --extern string_cache_codegen=${string_cache_codegen-0_5_4-97d30f50bccc433e}/libstring_cache_codegen-97d30f50bccc433e.rlib
      ln -s $OUT_DIR/"$CARGO_CRATE_NAME"-98d3ca65d550ea9a $OUT_DIR/build_script_build
      )
    '';
}
