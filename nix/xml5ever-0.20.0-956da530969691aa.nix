# generated from rustc-call.nix.handlebars
{ fn, pkgs, rustc, cargo, log-0_4_26-a0c046c56b014ecb, mac-0_1_1-f72a0f1a8d81125b, markup5ever-0_14_2-f3e7e28897c80712 }:
let
  rustc_arguments="";
in
  pkgs.stdenv.mkDerivation rec {
    name = "xml5ever-0_20_0-956da530969691aa";
    buildInputs = [];
    passthru.rust_crate_libraries = [log-0_4_26-a0c046c56b014ecb mac-0_1_1-f72a0f1a8d81125b markup5ever-0_14_2-f3e7e28897c80712];
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

    CARGO_CRATE_NAME = "xml5ever";
    CARGO_MANIFEST_DIR = "./xml5ever";
    CARGO_MANIFEST_PATH = "./xml5ever/Cargo.toml";
    CARGO_PKG_AUTHORS = "The xml5ever project developers";
    CARGO_PKG_DESCRIPTION = "Push based streaming parser for XML.";
    CARGO_PKG_HOMEPAGE = "https://github.com/servo/html5ever/blob/main/xml5ever/README.md";
    CARGO_PKG_LICENSE = "MIT OR Apache-2.0";
    CARGO_PKG_LICENSE_FILE = "";
    CARGO_PKG_NAME = "xml5ever";
    CARGO_PKG_README = "README.md";
    CARGO_PKG_REPOSITORY = "https://github.com/servo/html5ever";
    CARGO_PKG_RUST_VERSION = "1.70.0";
    CARGO_PKG_VERSION = "0.20.0";
    CARGO_PKG_VERSION_MAJOR = "0";
    CARGO_PKG_VERSION_MINOR = "20";
    CARGO_PKG_VERSION_PATCH = "0";
    CARGO_PKG_VERSION_PRE = "";
    CARGO_PRIMARY_PACKAGE = "1";
    CARGO_SBOM_PATH = "";

    buildPhase = ''
      export CARGO_MANIFEST_DIR=$(realpath $PWD/$CARGO_MANIFEST_DIR)
      export CARGO_MANIFEST_PATH=$(realpath $PWD/$CARGO_MANIFEST_PATH)

      mkdir -p $out
      export OUT_DIR=$out
      export INC_DIR=$(mktemp -d)

      echo -e "\e[92mCompiling\e[0m xml5ever-0_20_0-956da530969691aa"

      (set -x 
      ${rustc}/bin/rustc \
        --crate-name xml5ever \
        --edition=2021 xml5ever/src/lib.rs \
        --crate-type lib \
        --emit=dep-info,metadata,link \
        -C embed-bitcode=no \
        -C debuginfo=2 \
        ${rustc_arguments} \
        --check-cfg 'cfg(docsrs,test)' \
        --check-cfg 'cfg(feature, values("trace_tokenizer"))' \
        -C metadata=2f3eb3244bc8bd86 \
        -C extra-filename=-956da530969691aa \
        --out-dir $OUT_DIR \
        ${fn.rustc_linker_arguments passthru.rust_crate_libraries} \
        ${fn.rustc_propagated_arguments passthru.rust_script_build_run} \
        --extern log=${log-0_4_26-a0c046c56b014ecb}/liblog-a0c046c56b014ecb.rmeta \
        --extern mac=${mac-0_1_1-f72a0f1a8d81125b}/libmac-f72a0f1a8d81125b.rmeta \
        --extern markup5ever=${markup5ever-0_14_2-f3e7e28897c80712}/libmarkup5ever-f3e7e28897c80712.rmeta

      )
    '';
}
