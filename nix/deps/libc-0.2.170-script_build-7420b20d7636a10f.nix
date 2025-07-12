# generated from rustc-call.nix.handlebars
{ fn, pkgs, rustc, cargo }:
let
  rustc_arguments="";
in
  pkgs.stdenv.mkDerivation rec {
    name = "libc-0_2_170-script_build-7420b20d7636a10f";
    buildInputs = [];
    passthru.rust_crate_libraries = [];
    passthru.rust_crate_parent = [];
    passthru.rust_script_build_run = [];
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

    CARGO_CRATE_NAME = "build_script_build";
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

      echo -e "\e[92mCompiling\e[0m libc-0_2_170-script_build-7420b20d7636a10f"

      (set -x 
      ${rustc}/bin/rustc \
        --crate-name build_script_build \
        --edition=2021 build.rs \
        --crate-type bin \
        --emit=dep-info,link \
        -C embed-bitcode=no \
        ${rustc_arguments} \
        --cfg 'feature="default"' \
        --cfg 'feature="std"' \
        --check-cfg 'cfg(docsrs,test)' \
        --check-cfg 'cfg(feature, values("align", "const-extern-fn", "default", "extra_traits", "rustc-dep-of-std", "rustc-std-workspace-core", "std", "use_std"))' \
        -C metadata=fe809b3e8e8c7dc6 \
        -C extra-filename=-7420b20d7636a10f \
        --out-dir $OUT_DIR \
        ${fn.rustc_linker_arguments passthru.rust_crate_libraries} \
        ${fn.rustc_propagated_arguments passthru.rust_script_build_run} \
        --cap-lints allow
      ln -s $OUT_DIR/"$CARGO_CRATE_NAME"-7420b20d7636a10f $OUT_DIR/build_script_build
      )
    '';
}
