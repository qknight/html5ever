# generated from rustc-call.nix.handlebars
{ fn, pkgs, rustc, cargo, rand_core-0_6_4-2105b7fc93308a2c }:
let
  rustc_arguments="";
in
  pkgs.stdenv.mkDerivation rec {
    name = "rand-0_8_5-3ecba6d7e515d9fc";
    buildInputs = [];
    passthru.rust_crate_libraries = [rand_core-0_6_4-2105b7fc93308a2c];
    passthru.rust_crate_parent = [];
    passthru.rust_script_build_run = [];
    phases = "unpackPhase buildPhase";

    src = pkgs.fetchurl {
      url = "https://crates.io/api/v1/crates/rand/0.8.5/download";
      sha256 = "34af8d1a0e25924bc5b7c43c079c942339d8f0a8b57c39049bef581b46327404";
    };
    unpackPhase = ''
      tar xf $src
      cd rand-0.8.5
    '';

    RUSTC = "${rustc}/bin/rustc";
    CARGO = "${cargo}/bin/cargo";

    CARGO_CRATE_NAME = "rand";
    CARGO_MANIFEST_DIR = "./";
    CARGO_MANIFEST_PATH = "./Cargo.toml";
    CARGO_PKG_AUTHORS = "The Rand Project Developers:The Rust Project Developers";
    CARGO_PKG_DESCRIPTION = "Random number generators and other randomness functionality.
";
    CARGO_PKG_HOMEPAGE = "https://rust-random.github.io/book";
    CARGO_PKG_LICENSE = "MIT OR Apache-2.0";
    CARGO_PKG_LICENSE_FILE = "";
    CARGO_PKG_NAME = "rand";
    CARGO_PKG_README = "README.md";
    CARGO_PKG_REPOSITORY = "https://github.com/rust-random/rand";
    CARGO_PKG_RUST_VERSION = "";
    CARGO_PKG_VERSION = "0.8.5";
    CARGO_PKG_VERSION_MAJOR = "0";
    CARGO_PKG_VERSION_MINOR = "8";
    CARGO_PKG_VERSION_PATCH = "5";
    CARGO_PKG_VERSION_PRE = "";

    buildPhase = ''
      export CARGO_MANIFEST_DIR=$(realpath $PWD/$CARGO_MANIFEST_DIR)
      export CARGO_MANIFEST_PATH=$(realpath $PWD/$CARGO_MANIFEST_PATH)

      mkdir -p $out
      export OUT_DIR=$out
      export INC_DIR=$(mktemp -d)

      echo -e "\e[92mCompiling\e[0m rand-0_8_5-3ecba6d7e515d9fc"

      (set -x 
      ${rustc}/bin/rustc \
        --crate-name rand \
        --edition=2018 src/lib.rs \
        --crate-type lib \
        --emit=dep-info,metadata,link \
        -C embed-bitcode=no \
        ${rustc_arguments} \
        --cfg 'feature="small_rng"' \
        --check-cfg 'cfg(docsrs,test)' \
        --check-cfg 'cfg(feature, values("alloc", "default", "getrandom", "libc", "log", "min_const_gen", "nightly", "packed_simd", "rand_chacha", "serde", "serde1", "simd_support", "small_rng", "std", "std_rng"))' \
        -C metadata=e30f230f209a0964 \
        -C extra-filename=-3ecba6d7e515d9fc \
        --out-dir $OUT_DIR \
        ${fn.rustc_linker_arguments passthru.rust_crate_libraries} \
        ${fn.rustc_propagated_arguments passthru.rust_script_build_run} \
        --extern rand_core=${rand_core-0_6_4-2105b7fc93308a2c}/librand_core-2105b7fc93308a2c.rmeta \
        --cap-lints allow

      )
    '';
}
