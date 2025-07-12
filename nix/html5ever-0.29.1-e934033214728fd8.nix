# generated from rustc-call.nix.handlebars
{ fn, pkgs, rustc, cargo, log-0_4_26-a0c046c56b014ecb, mac-0_1_1-f72a0f1a8d81125b, markup5ever-0_14_2-f3e7e28897c80712, match_token-0_1_0-dd637fcffe177fc3 }:
let
  rustc_arguments="";
in
  pkgs.stdenv.mkDerivation rec {
    name = "html5ever-0_29_1-e934033214728fd8";
    buildInputs = [];
    passthru.rust_crate_libraries = [log-0_4_26-a0c046c56b014ecb mac-0_1_1-f72a0f1a8d81125b markup5ever-0_14_2-f3e7e28897c80712 match_token-0_1_0-dd637fcffe177fc3];
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

    CARGO_CRATE_NAME = "html5ever";
    CARGO_MANIFEST_DIR = "./html5ever";
    CARGO_MANIFEST_PATH = "./html5ever/Cargo.toml";
    CARGO_PKG_AUTHORS = "The html5ever Project Developers";
    CARGO_PKG_DESCRIPTION = "High-performance browser-grade HTML5 parser";
    CARGO_PKG_HOMEPAGE = "";
    CARGO_PKG_LICENSE = "MIT OR Apache-2.0";
    CARGO_PKG_LICENSE_FILE = "";
    CARGO_PKG_NAME = "html5ever";
    CARGO_PKG_README = "../README.md";
    CARGO_PKG_REPOSITORY = "https://github.com/servo/html5ever";
    CARGO_PKG_RUST_VERSION = "1.70.0";
    CARGO_PKG_VERSION = "0.29.1";
    CARGO_PKG_VERSION_MAJOR = "0";
    CARGO_PKG_VERSION_MINOR = "29";
    CARGO_PKG_VERSION_PATCH = "1";
    CARGO_PKG_VERSION_PRE = "";
    CARGO_PRIMARY_PACKAGE = "1";
    CARGO_SBOM_PATH = "";

    buildPhase = ''
      export CARGO_MANIFEST_DIR=$(realpath $PWD/$CARGO_MANIFEST_DIR)
      export CARGO_MANIFEST_PATH=$(realpath $PWD/$CARGO_MANIFEST_PATH)

      mkdir -p $out
      export OUT_DIR=$out
      export INC_DIR=$(mktemp -d)

      echo -e "\e[92mCompiling\e[0m html5ever-0_29_1-e934033214728fd8"

      (set -x 
      ${rustc}/bin/rustc \
        --crate-name html5ever \
        --edition=2021 html5ever/src/lib.rs \
        --crate-type lib \
        --emit=dep-info,metadata,link \
        -C embed-bitcode=no \
        -C debuginfo=2 \
        ${rustc_arguments} \
        --check-cfg 'cfg(docsrs,test)' \
        --check-cfg 'cfg(feature, values("trace_tokenizer"))' \
        -C metadata=98f05e760912c547 \
        -C extra-filename=-e934033214728fd8 \
        --out-dir $OUT_DIR \
        ${fn.rustc_linker_arguments passthru.rust_crate_libraries} \
        ${fn.rustc_propagated_arguments passthru.rust_script_build_run} \
        --extern log=${log-0_4_26-a0c046c56b014ecb}/liblog-a0c046c56b014ecb.rmeta \
        --extern mac=${mac-0_1_1-f72a0f1a8d81125b}/libmac-f72a0f1a8d81125b.rmeta \
        --extern markup5ever=${markup5ever-0_14_2-f3e7e28897c80712}/libmarkup5ever-f3e7e28897c80712.rmeta \
        --extern match_token=${match_token-0_1_0-dd637fcffe177fc3}/libmatch_token-dd637fcffe177fc3.so

      )
    '';
}
