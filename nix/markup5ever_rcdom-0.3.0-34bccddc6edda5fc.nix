# generated from rustc-call.nix.handlebars
{ fn, pkgs, rustc, cargo, html5ever-0_29_1-e934033214728fd8, markup5ever-0_14_2-f3e7e28897c80712, tendril-0_4_3-0665232631306e47, xml5ever-0_20_0-956da530969691aa }:
let
  rustc_arguments="";
in
  pkgs.stdenv.mkDerivation rec {
    name = "markup5ever_rcdom-0_3_0-34bccddc6edda5fc";
    buildInputs = [];
    passthru.rust_crate_libraries = [html5ever-0_29_1-e934033214728fd8 markup5ever-0_14_2-f3e7e28897c80712 tendril-0_4_3-0665232631306e47 xml5ever-0_20_0-956da530969691aa];
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

    CARGO_CRATE_NAME = "markup5ever_rcdom";
    CARGO_MANIFEST_DIR = "./rcdom";
    CARGO_MANIFEST_PATH = "./rcdom/Cargo.toml";
    CARGO_PKG_AUTHORS = "The html5ever Project Developers";
    CARGO_PKG_DESCRIPTION = "Basic, unsupported DOM structure for use by tests in html5ever/xml5ever";
    CARGO_PKG_HOMEPAGE = "";
    CARGO_PKG_LICENSE = "MIT OR Apache-2.0";
    CARGO_PKG_LICENSE_FILE = "";
    CARGO_PKG_NAME = "markup5ever_rcdom";
    CARGO_PKG_README = "README.md";
    CARGO_PKG_REPOSITORY = "https://github.com/servo/html5ever";
    CARGO_PKG_RUST_VERSION = "";
    CARGO_PKG_VERSION = "0.3.0";
    CARGO_PKG_VERSION_MAJOR = "0";
    CARGO_PKG_VERSION_MINOR = "3";
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

      echo -e "\e[92mCompiling\e[0m markup5ever_rcdom-0_3_0-34bccddc6edda5fc"

      (set -x 
      ${rustc}/bin/rustc \
        --crate-name markup5ever_rcdom \
        --edition=2021 rcdom/lib.rs \
        --crate-type lib \
        --emit=dep-info,metadata,link \
        -C embed-bitcode=no \
        -C debuginfo=2 \
        ${rustc_arguments} \
        --check-cfg 'cfg(docsrs,test)' \
        --check-cfg 'cfg(feature, values())' \
        -C metadata=0d7709b460f87629 \
        -C extra-filename=-34bccddc6edda5fc \
        --out-dir $OUT_DIR \
        ${fn.rustc_linker_arguments passthru.rust_crate_libraries} \
        ${fn.rustc_propagated_arguments passthru.rust_script_build_run} \
        --extern html5ever=${html5ever-0_29_1-e934033214728fd8}/libhtml5ever-e934033214728fd8.rmeta \
        --extern markup5ever=${markup5ever-0_14_2-f3e7e28897c80712}/libmarkup5ever-f3e7e28897c80712.rmeta \
        --extern tendril=${tendril-0_4_3-0665232631306e47}/libtendril-0665232631306e47.rmeta \
        --extern xml5ever=${xml5ever-0_20_0-956da530969691aa}/libxml5ever-956da530969691aa.rmeta

      )
    '';
}
