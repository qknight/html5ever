# generated from rustc-call.nix.handlebars
{ fn, pkgs, rustc, cargo, serde-1_0_218-script_build_run-679977d4f26d90fb }:
let
  rustc_arguments = fn.rustc_arguments serde-1_0_218-script_build_run-679977d4f26d90fb;
in
  pkgs.stdenv.mkDerivation rec {
    name = "serde-1_0_218-60d80c2d94243f7d";
    buildInputs = [];
    passthru.rust_crate_libraries = [];
    passthru.rust_crate_parent = [serde-1_0_218-script_build_run-679977d4f26d90fb];
    passthru.rust_script_build_run = [serde-1_0_218-script_build_run-679977d4f26d90fb];
    phases = "unpackPhase buildPhase";

    src = pkgs.fetchurl {
      url = "https://crates.io/api/v1/crates/serde/1.0.218/download";
      sha256 = "e8dfc9d19bdbf6d17e22319da49161d5d0108e4188e8b680aef6299eed22df60";
    };
    unpackPhase = ''
      tar xf $src
      cd serde-1.0.218
    '';

    RUSTC = "${rustc}/bin/rustc";
    CARGO = "${cargo}/bin/cargo";

    CARGO_CRATE_NAME = "serde";
    CARGO_MANIFEST_DIR = "./";
    CARGO_MANIFEST_PATH = "./Cargo.toml";
    CARGO_PKG_AUTHORS = "Erick Tryzelaar <erick.tryzelaar@gmail.com>:David Tolnay <dtolnay@gmail.com>";
    CARGO_PKG_DESCRIPTION = "A generic serialization/deserialization framework";
    CARGO_PKG_HOMEPAGE = "https://serde.rs";
    CARGO_PKG_LICENSE = "MIT OR Apache-2.0";
    CARGO_PKG_LICENSE_FILE = "";
    CARGO_PKG_NAME = "serde";
    CARGO_PKG_README = "crates-io.md";
    CARGO_PKG_REPOSITORY = "https://github.com/serde-rs/serde";
    CARGO_PKG_RUST_VERSION = "1.31";
    CARGO_PKG_VERSION = "1.0.218";
    CARGO_PKG_VERSION_MAJOR = "1";
    CARGO_PKG_VERSION_MINOR = "0";
    CARGO_PKG_VERSION_PATCH = "218";
    CARGO_PKG_VERSION_PRE = "";

    buildPhase = ''
      export CARGO_MANIFEST_DIR=$(realpath $PWD/$CARGO_MANIFEST_DIR)
      export CARGO_MANIFEST_PATH=$(realpath $PWD/$CARGO_MANIFEST_PATH)

      mkdir -p $out
      export OUT_DIR=$out
      export INC_DIR=$(mktemp -d)

      echo -e "\e[92mCompiling\e[0m serde-1_0_218-60d80c2d94243f7d"
      cp -r ${serde-1_0_218-script_build_run-679977d4f26d90fb}/* $OUT_DIR
      for file in $out/environment-variables $out/environment-propagated-variables $out/rustc-arguments $out/rustc-propagated-arguments; do
          if [ -f "$file" ]; then
              sed -i "s|${serde-1_0_218-script_build_run-679977d4f26d90fb}|$out|g" "$file"
          fi
      done
      if [ -f ${serde-1_0_218-script_build_run-679977d4f26d90fb}/environment-variables ]; then
          set -a
          source ${serde-1_0_218-script_build_run-679977d4f26d90fb}/environment-variables; 
          set +a
      fi
      if [ -f ${serde-1_0_218-script_build_run-679977d4f26d90fb}/environment-propagated-variables ]; then
          set -a
          echo -e "\033[38;5;208m$(cat ${serde-1_0_218-script_build_run-679977d4f26d90fb}/environment-propagated-variables)\033[0m"
          source ${serde-1_0_218-script_build_run-679977d4f26d90fb}/environment-propagated-variables;
          set +a
      fi
      for file in ${fn.environment_propagated_variables passthru.rust_script_build_run}; do
          if [ -f $file ]; then
              set -a
              echo -e "\033[38;5;208m$(cat $file)\033[0m"
              source $file
              set +a
          fi  
      done
      (set -x 
      ${rustc}/bin/rustc \
        --crate-name serde \
        --edition=2018 src/lib.rs \
        --crate-type lib \
        --emit=dep-info,metadata,link \
        -C embed-bitcode=no \
        -C debuginfo=2 \
        ${rustc_arguments} \
        --cfg 'feature="default"' \
        --cfg 'feature="std"' \
        --check-cfg 'cfg(docsrs,test)' \
        --check-cfg 'cfg(feature, values("alloc", "default", "derive", "rc", "serde_derive", "std", "unstable"))' \
        -C metadata=089207e929eb73dc \
        -C extra-filename=-60d80c2d94243f7d \
        --out-dir $OUT_DIR \
        ${fn.rustc_linker_arguments passthru.rust_crate_libraries} \
        ${fn.rustc_propagated_arguments passthru.rust_script_build_run} \
        --cap-lints allow

      )
    '';
}
