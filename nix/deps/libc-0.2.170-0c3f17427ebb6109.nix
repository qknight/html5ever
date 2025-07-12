# generated from rustc-call.nix.handlebars
{ fn, pkgs, rustc, cargo, libc-0_2_170-script_build_run-d9daaf21b0dea361 }:
let
  rustc_arguments = fn.rustc_arguments libc-0_2_170-script_build_run-d9daaf21b0dea361;
in
  pkgs.stdenv.mkDerivation rec {
    name = "libc-0_2_170-0c3f17427ebb6109";
    buildInputs = [];
    passthru.rust_crate_libraries = [];
    passthru.rust_crate_parent = [libc-0_2_170-script_build_run-d9daaf21b0dea361];
    passthru.rust_script_build_run = [libc-0_2_170-script_build_run-d9daaf21b0dea361];
    phases = "unpackPhase buildPhase";

    src = pkgs.fetchurl {
      url = "https://crates.io/api/v1/crates/libc/0.2.170/download";
      sha256 = "875b3680cb2f8f71bdcf9a30f38d48282f5d3c95cbf9b3fa57269bb5d5c06828";
    };
    unpackPhase = ''
      tar xf $src
      cd libc-0.2.170
    '';

    RUSTC = "${rustc}/bin/rustc";
    CARGO = "${cargo}/bin/cargo";

    CARGO_CRATE_NAME = "libc";
    CARGO_MANIFEST_DIR = "./";
    CARGO_MANIFEST_PATH = "./Cargo.toml";
    CARGO_PKG_AUTHORS = "The Rust Project Developers";
    CARGO_PKG_DESCRIPTION = "Raw FFI bindings to platform libraries like libc.
";
    CARGO_PKG_HOMEPAGE = "https://github.com/rust-lang/libc";
    CARGO_PKG_LICENSE = "MIT OR Apache-2.0";
    CARGO_PKG_LICENSE_FILE = "";
    CARGO_PKG_NAME = "libc";
    CARGO_PKG_README = "README.md";
    CARGO_PKG_REPOSITORY = "https://github.com/rust-lang/libc";
    CARGO_PKG_RUST_VERSION = "1.63";
    CARGO_PKG_VERSION = "0.2.170";
    CARGO_PKG_VERSION_MAJOR = "0";
    CARGO_PKG_VERSION_MINOR = "2";
    CARGO_PKG_VERSION_PATCH = "170";
    CARGO_PKG_VERSION_PRE = "";

    buildPhase = ''
      export CARGO_MANIFEST_DIR=$(realpath $PWD/$CARGO_MANIFEST_DIR)
      export CARGO_MANIFEST_PATH=$(realpath $PWD/$CARGO_MANIFEST_PATH)

      mkdir -p $out
      export OUT_DIR=$out
      export INC_DIR=$(mktemp -d)

      echo -e "\e[92mCompiling\e[0m libc-0_2_170-0c3f17427ebb6109"
      cp -r ${libc-0_2_170-script_build_run-d9daaf21b0dea361}/* $OUT_DIR
      for file in $out/environment-variables $out/environment-propagated-variables $out/rustc-arguments $out/rustc-propagated-arguments; do
          if [ -f "$file" ]; then
              sed -i "s|${libc-0_2_170-script_build_run-d9daaf21b0dea361}|$out|g" "$file"
          fi
      done
      if [ -f ${libc-0_2_170-script_build_run-d9daaf21b0dea361}/environment-variables ]; then
          set -a
          source ${libc-0_2_170-script_build_run-d9daaf21b0dea361}/environment-variables; 
          set +a
      fi
      if [ -f ${libc-0_2_170-script_build_run-d9daaf21b0dea361}/environment-propagated-variables ]; then
          set -a
          echo -e "\033[38;5;208m$(cat ${libc-0_2_170-script_build_run-d9daaf21b0dea361}/environment-propagated-variables)\033[0m"
          source ${libc-0_2_170-script_build_run-d9daaf21b0dea361}/environment-propagated-variables;
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
        --crate-name libc \
        --edition=2021 src/lib.rs \
        --crate-type lib \
        --emit=dep-info,metadata,link \
        -C embed-bitcode=no \
        -C debuginfo=2 \
        ${rustc_arguments} \
        --cfg 'feature="default"' \
        --cfg 'feature="std"' \
        --check-cfg 'cfg(docsrs,test)' \
        --check-cfg 'cfg(feature, values("align", "const-extern-fn", "default", "extra_traits", "rustc-dep-of-std", "rustc-std-workspace-core", "std", "use_std"))' \
        -C metadata=322641206de8a70c \
        -C extra-filename=-0c3f17427ebb6109 \
        --out-dir $OUT_DIR \
        ${fn.rustc_linker_arguments passthru.rust_crate_libraries} \
        ${fn.rustc_propagated_arguments passthru.rust_script_build_run} \
        --cap-lints allow

      )
    '';
}
