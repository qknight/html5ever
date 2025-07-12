# generated from rustc-call.nix.handlebars
{ fn, pkgs, rustc, cargo, mac-0_1_1-f72a0f1a8d81125b, new_debug_unreachable-1_0_6-6b7ba0743db86426 }:
let
  rustc_arguments="";
in
  pkgs.stdenv.mkDerivation rec {
    name = "futf-0_1_5-8183acd663cd8e61";
    buildInputs = [];
    passthru.rust_crate_libraries = [mac-0_1_1-f72a0f1a8d81125b new_debug_unreachable-1_0_6-6b7ba0743db86426];
    passthru.rust_crate_parent = [];
    passthru.rust_script_build_run = [];
    phases = "unpackPhase buildPhase";

    src = pkgs.fetchurl {
      url = "https://crates.io/api/v1/crates/futf/0.1.5/download";
      sha256 = "df420e2e84819663797d1ec6544b13c5be84629e7bb00dc960d6917db2987843";
    };
    unpackPhase = ''
      tar xf $src
      cd futf-0.1.5
    '';

    RUSTC = "${rustc}/bin/rustc";
    CARGO = "${cargo}/bin/cargo";

    CARGO_CRATE_NAME = "futf";
    CARGO_MANIFEST_DIR = "./";
    CARGO_MANIFEST_PATH = "./Cargo.toml";
    CARGO_PKG_AUTHORS = "Keegan McAllister <kmcallister@mozilla.com>";
    CARGO_PKG_DESCRIPTION = "Handling fragments of UTF-8";
    CARGO_PKG_HOMEPAGE = "";
    CARGO_PKG_LICENSE = "MIT / Apache-2.0";
    CARGO_PKG_LICENSE_FILE = "";
    CARGO_PKG_NAME = "futf";
    CARGO_PKG_README = "README.md";
    CARGO_PKG_REPOSITORY = "https://github.com/servo/futf";
    CARGO_PKG_RUST_VERSION = "";
    CARGO_PKG_VERSION = "0.1.5";
    CARGO_PKG_VERSION_MAJOR = "0";
    CARGO_PKG_VERSION_MINOR = "1";
    CARGO_PKG_VERSION_PATCH = "5";
    CARGO_PKG_VERSION_PRE = "";

    buildPhase = ''
      export CARGO_MANIFEST_DIR=$(realpath $PWD/$CARGO_MANIFEST_DIR)
      export CARGO_MANIFEST_PATH=$(realpath $PWD/$CARGO_MANIFEST_PATH)

      mkdir -p $out
      export OUT_DIR=$out
      export INC_DIR=$(mktemp -d)

      echo -e "\e[92mCompiling\e[0m futf-0_1_5-8183acd663cd8e61"

      (set -x 
      ${rustc}/bin/rustc \
        --crate-name futf \
        --edition=2015 src/lib.rs \
        --crate-type lib \
        --emit=dep-info,metadata,link \
        -C embed-bitcode=no \
        -C debuginfo=2 \
        ${rustc_arguments} \
        --check-cfg 'cfg(docsrs,test)' \
        --check-cfg 'cfg(feature, values())' \
        -C metadata=cc780ce5c83375c1 \
        -C extra-filename=-8183acd663cd8e61 \
        --out-dir $OUT_DIR \
        ${fn.rustc_linker_arguments passthru.rust_crate_libraries} \
        ${fn.rustc_propagated_arguments passthru.rust_script_build_run} \
        --extern mac=${mac-0_1_1-f72a0f1a8d81125b}/libmac-f72a0f1a8d81125b.rmeta \
        --extern debug_unreachable=${new_debug_unreachable-1_0_6-6b7ba0743db86426}/libdebug_unreachable-6b7ba0743db86426.rmeta \
        --cap-lints allow

      )
    '';
}
