# generated from rustc-call.nix.handlebars
{ fn, pkgs, rustc, cargo, log-0_4_26-a0c046c56b014ecb, markup5ever-0_14_2-script_build_run-7378ee86ff42466a, phf-0_11_3-5d0c9c668950d25c, string_cache-0_8_8-a0a8b339a65dd0e5, tendril-0_4_3-0665232631306e47 }:
let
  rustc_arguments = fn.rustc_arguments markup5ever-0_14_2-script_build_run-7378ee86ff42466a;
in
  pkgs.stdenv.mkDerivation rec {
    name = "markup5ever-0_14_2-f3e7e28897c80712";
    buildInputs = [];
    passthru.rust_crate_libraries = [log-0_4_26-a0c046c56b014ecb phf-0_11_3-5d0c9c668950d25c string_cache-0_8_8-a0a8b339a65dd0e5 tendril-0_4_3-0665232631306e47];
    passthru.rust_crate_parent = [markup5ever-0_14_2-script_build_run-7378ee86ff42466a];
    passthru.rust_script_build_run = [markup5ever-0_14_2-script_build_run-7378ee86ff42466a];
    phases = "unpackPhase buildPhase";

    src = builtins.filterSource
      (path: type:
        let base = baseNameOf path;
        in !(base == "target" || base == "result" || builtins.match "result-*" base != null)
      ) /home/nixos/html5ever;
    unpackPhase = "";

    RUSTC = "${rustc}/bin/rustc";
    CARGO = "${cargo}/bin/cargo";

    CARGO_CRATE_NAME = "markup5ever";
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

      echo -e "\e[92mCompiling\e[0m markup5ever-0_14_2-f3e7e28897c80712"
      cp -r ${markup5ever-0_14_2-script_build_run-7378ee86ff42466a}/* $OUT_DIR
      for file in $out/environment-variables $out/environment-propagated-variables $out/rustc-arguments $out/rustc-propagated-arguments; do
          if [ -f "$file" ]; then
              sed -i "s|${markup5ever-0_14_2-script_build_run-7378ee86ff42466a}|$out|g" "$file"
          fi
      done
      if [ -f ${markup5ever-0_14_2-script_build_run-7378ee86ff42466a}/environment-variables ]; then
          set -a
          source ${markup5ever-0_14_2-script_build_run-7378ee86ff42466a}/environment-variables; 
          set +a
      fi
      if [ -f ${markup5ever-0_14_2-script_build_run-7378ee86ff42466a}/environment-propagated-variables ]; then
          set -a
          echo -e "\033[38;5;208m$(cat ${markup5ever-0_14_2-script_build_run-7378ee86ff42466a}/environment-propagated-variables)\033[0m"
          source ${markup5ever-0_14_2-script_build_run-7378ee86ff42466a}/environment-propagated-variables;
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
        --crate-name markup5ever \
        --edition=2021 markup5ever/lib.rs \
        --crate-type lib \
        --emit=dep-info,metadata,link \
        -C embed-bitcode=no \
        -C debuginfo=2 \
        ${rustc_arguments} \
        --check-cfg 'cfg(docsrs,test)' \
        --check-cfg 'cfg(feature, values())' \
        -C metadata=f6ea0b1bbfb295d8 \
        -C extra-filename=-f3e7e28897c80712 \
        --out-dir $OUT_DIR \
        ${fn.rustc_linker_arguments passthru.rust_crate_libraries} \
        ${fn.rustc_propagated_arguments passthru.rust_script_build_run} \
        --extern log=${log-0_4_26-a0c046c56b014ecb}/liblog-a0c046c56b014ecb.rmeta \
        --extern phf=${phf-0_11_3-5d0c9c668950d25c}/libphf-5d0c9c668950d25c.rmeta \
        --extern string_cache=${string_cache-0_8_8-a0a8b339a65dd0e5}/libstring_cache-a0a8b339a65dd0e5.rmeta \
        --extern tendril=${tendril-0_4_3-0665232631306e47}/libtendril-0665232631306e47.rmeta

      )
    '';
}
