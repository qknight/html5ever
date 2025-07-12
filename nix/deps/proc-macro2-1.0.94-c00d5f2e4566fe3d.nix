# generated from rustc-call.nix.handlebars
{ fn, pkgs, rustc, cargo, proc-macro2-1_0_94-script_build_run-811184542e54f117, unicode-ident-1_0_18-5783d1ad3b24ccf6 }:
let
  rustc_arguments = fn.rustc_arguments proc-macro2-1_0_94-script_build_run-811184542e54f117;
in
  pkgs.stdenv.mkDerivation rec {
    name = "proc-macro2-1_0_94-c00d5f2e4566fe3d";
    buildInputs = [];
    passthru.rust_crate_libraries = [unicode-ident-1_0_18-5783d1ad3b24ccf6];
    passthru.rust_crate_parent = [proc-macro2-1_0_94-script_build_run-811184542e54f117];
    passthru.rust_script_build_run = [proc-macro2-1_0_94-script_build_run-811184542e54f117];
    phases = "unpackPhase buildPhase";

    src = pkgs.fetchurl {
      url = "https://crates.io/api/v1/crates/proc-macro2/1.0.94/download";
      sha256 = "a31971752e70b8b2686d7e46ec17fb38dad4051d94024c88df49b667caea9c84";
    };
    unpackPhase = ''
      tar xf $src
      cd proc-macro2-1.0.94
    '';

    RUSTC = "${rustc}/bin/rustc";
    CARGO = "${cargo}/bin/cargo";

    CARGO_CRATE_NAME = "proc_macro2";
    CARGO_MANIFEST_DIR = "./";
    CARGO_MANIFEST_PATH = "./Cargo.toml";
    CARGO_PKG_AUTHORS = "David Tolnay <dtolnay@gmail.com>:Alex Crichton <alex@alexcrichton.com>";
    CARGO_PKG_DESCRIPTION = "A substitute implementation of the compiler's `proc_macro` API to decouple token-based libraries from the procedural macro use case.";
    CARGO_PKG_HOMEPAGE = "";
    CARGO_PKG_LICENSE = "MIT OR Apache-2.0";
    CARGO_PKG_LICENSE_FILE = "";
    CARGO_PKG_NAME = "proc-macro2";
    CARGO_PKG_README = "README.md";
    CARGO_PKG_REPOSITORY = "https://github.com/dtolnay/proc-macro2";
    CARGO_PKG_RUST_VERSION = "1.56";
    CARGO_PKG_VERSION = "1.0.94";
    CARGO_PKG_VERSION_MAJOR = "1";
    CARGO_PKG_VERSION_MINOR = "0";
    CARGO_PKG_VERSION_PATCH = "94";
    CARGO_PKG_VERSION_PRE = "";

    buildPhase = ''
      export CARGO_MANIFEST_DIR=$(realpath $PWD/$CARGO_MANIFEST_DIR)
      export CARGO_MANIFEST_PATH=$(realpath $PWD/$CARGO_MANIFEST_PATH)

      mkdir -p $out
      export OUT_DIR=$out
      export INC_DIR=$(mktemp -d)

      echo -e "\e[92mCompiling\e[0m proc-macro2-1_0_94-c00d5f2e4566fe3d"
      cp -r ${proc-macro2-1_0_94-script_build_run-811184542e54f117}/* $OUT_DIR
      for file in $out/environment-variables $out/environment-propagated-variables $out/rustc-arguments $out/rustc-propagated-arguments; do
          if [ -f "$file" ]; then
              sed -i "s|${proc-macro2-1_0_94-script_build_run-811184542e54f117}|$out|g" "$file"
          fi
      done
      if [ -f ${proc-macro2-1_0_94-script_build_run-811184542e54f117}/environment-variables ]; then
          set -a
          source ${proc-macro2-1_0_94-script_build_run-811184542e54f117}/environment-variables; 
          set +a
      fi
      if [ -f ${proc-macro2-1_0_94-script_build_run-811184542e54f117}/environment-propagated-variables ]; then
          set -a
          echo -e "\033[38;5;208m$(cat ${proc-macro2-1_0_94-script_build_run-811184542e54f117}/environment-propagated-variables)\033[0m"
          source ${proc-macro2-1_0_94-script_build_run-811184542e54f117}/environment-propagated-variables;
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
        --crate-name proc_macro2 \
        --edition=2021 src/lib.rs \
        --crate-type lib \
        --emit=dep-info,metadata,link \
        -C embed-bitcode=no \
        ${rustc_arguments} \
        --cfg 'feature="default"' \
        --cfg 'feature="proc-macro"' \
        --check-cfg 'cfg(docsrs,test)' \
        --check-cfg 'cfg(feature, values("default", "nightly", "proc-macro", "span-locations"))' \
        -C metadata=c304e27f039a9105 \
        -C extra-filename=-c00d5f2e4566fe3d \
        --out-dir $OUT_DIR \
        ${fn.rustc_linker_arguments passthru.rust_crate_libraries} \
        ${fn.rustc_propagated_arguments passthru.rust_script_build_run} \
        --extern unicode_ident=${unicode-ident-1_0_18-5783d1ad3b24ccf6}/libunicode_ident-5783d1ad3b24ccf6.rmeta \
        --cap-lints allow

      )
    '';
}
