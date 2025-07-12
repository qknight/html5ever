# generated from default.nix.handlebars
{ pkgs ? import <nixpkgs> {} }:

let
  callPackage' = pkgs.lib.callPackageWith (pkgs // self);
  fn = rec {
    allCollectedInputs = a: pkgs.lib.unique (
      builtins.foldl' (acc: el: acc ++ [el] ++ (allCollectedInputs el.rust_crate_libraries)) [] a
    );
    rustc_linker_arguments = rust_crate_libraries: builtins.concatStringsSep " " (map (lib: "-L ${lib}") (allCollectedInputs rust_crate_libraries));
    rustc_arguments = crate: pkgs.lib.replaceString "\n" "" (
      if builtins.pathExists "${crate}/rustc-arguments" then
          builtins.readFile "${crate}/rustc-arguments"
      else
        "");
    rustc_propagated_arguments = rust_crate_libraries: pkgs.lib.replaceString "\n" "" (builtins.concatStringsSep " " (map (crate: 
      if builtins.pathExists "${crate}/rustc-propagated-arguments" then
          builtins.readFile "${crate}/rustc-propagated-arguments"
      else
        ""
      ) (allCollectedInputs rust_crate_libraries)));
    environment_propagated_variables = rust_script_build_run: builtins.concatStringsSep " " (map (d: "${d}/environment-propagated-variables") rust_script_build_run);
  };
  self = {
    autocfg-1_4_0-33a18d854aead0c6 = callPackage' ./deps/autocfg-1.4.0-33a18d854aead0c6.nix { inherit fn; };
    cfg-if-1_0_0-2b1095f2195c1f61 = callPackage' ./deps/cfg-if-1.0.0-2b1095f2195c1f61.nix { inherit fn; };
    futf-0_1_5-8183acd663cd8e61 = callPackage' ./deps/futf-0.1.5-8183acd663cd8e61.nix { inherit fn; };
    html5ever-0_29_1-e934033214728fd8 = callPackage' ./html5ever-0.29.1-e934033214728fd8.nix { inherit fn; };
    libc-0_2_170-0c3f17427ebb6109 = callPackage' ./deps/libc-0.2.170-0c3f17427ebb6109.nix { inherit fn; };
    libc-0_2_170-script_build-7420b20d7636a10f = callPackage' ./deps/libc-0.2.170-script_build-7420b20d7636a10f.nix { inherit fn; };
    libc-0_2_170-script_build_run-d9daaf21b0dea361 = callPackage' ./deps/libc-0.2.170-script_build_run-d9daaf21b0dea361.nix { inherit fn; };
    lock_api-0_4_12-5446635aac5ff34d = callPackage' ./deps/lock_api-0.4.12-5446635aac5ff34d.nix { inherit fn; };
    lock_api-0_4_12-script_build-b58f30001d63f344 = callPackage' ./deps/lock_api-0.4.12-script_build-b58f30001d63f344.nix { inherit fn; };
    lock_api-0_4_12-script_build_run-7484fdb636053cb2 = callPackage' ./deps/lock_api-0.4.12-script_build_run-7484fdb636053cb2.nix { inherit fn; };
    log-0_4_26-a0c046c56b014ecb = callPackage' ./deps/log-0.4.26-a0c046c56b014ecb.nix { inherit fn; };
    mac-0_1_1-f72a0f1a8d81125b = callPackage' ./deps/mac-0.1.1-f72a0f1a8d81125b.nix { inherit fn; };
    markup5ever-0_14_2-f3e7e28897c80712 = callPackage' ./markup5ever-0.14.2-f3e7e28897c80712.nix { inherit fn; };
    markup5ever-0_14_2-script_build-98d3ca65d550ea9a = callPackage' ./markup5ever-0.14.2-script_build-98d3ca65d550ea9a.nix { inherit fn; };
    markup5ever-0_14_2-script_build_run-7378ee86ff42466a = callPackage' ./markup5ever-0.14.2-script_build_run-7378ee86ff42466a.nix { inherit fn; };
    markup5ever_rcdom-0_3_0-34bccddc6edda5fc = callPackage' ./markup5ever_rcdom-0.3.0-34bccddc6edda5fc.nix { inherit fn; };
    match_token-0_1_0-dd637fcffe177fc3 = callPackage' ./match_token-0.1.0-dd637fcffe177fc3.nix { inherit fn; };
    new_debug_unreachable-1_0_6-6b7ba0743db86426 = callPackage' ./deps/new_debug_unreachable-1.0.6-6b7ba0743db86426.nix { inherit fn; };
    parking_lot-0_12_3-e1786befdffcd2a8 = callPackage' ./deps/parking_lot-0.12.3-e1786befdffcd2a8.nix { inherit fn; };
    parking_lot_core-0_9_10-4b67ff05bab6e753 = callPackage' ./deps/parking_lot_core-0.9.10-4b67ff05bab6e753.nix { inherit fn; };
    parking_lot_core-0_9_10-script_build-0a31634d6df47fe2 = callPackage' ./deps/parking_lot_core-0.9.10-script_build-0a31634d6df47fe2.nix { inherit fn; };
    parking_lot_core-0_9_10-script_build_run-afc754d01e5f222a = callPackage' ./deps/parking_lot_core-0.9.10-script_build_run-afc754d01e5f222a.nix { inherit fn; };
    phf-0_11_3-5d0c9c668950d25c = callPackage' ./deps/phf-0.11.3-5d0c9c668950d25c.nix { inherit fn; };
    phf_codegen-0_11_3-f8ffd13b9a34c4ec = callPackage' ./deps/phf_codegen-0.11.3-f8ffd13b9a34c4ec.nix { inherit fn; };
    phf_generator-0_11_3-c688b166d2afc894 = callPackage' ./deps/phf_generator-0.11.3-c688b166d2afc894.nix { inherit fn; };
    phf_shared-0_11_3-ec50c9c17879817d = callPackage' ./deps/phf_shared-0.11.3-ec50c9c17879817d.nix { inherit fn; };
    precomputed-hash-0_1_1-89bfd43691c36a5a = callPackage' ./deps/precomputed-hash-0.1.1-89bfd43691c36a5a.nix { inherit fn; };
    proc-macro2-1_0_94-c00d5f2e4566fe3d = callPackage' ./deps/proc-macro2-1.0.94-c00d5f2e4566fe3d.nix { inherit fn; };
    proc-macro2-1_0_94-script_build-0c3b9fcc96165103 = callPackage' ./deps/proc-macro2-1.0.94-script_build-0c3b9fcc96165103.nix { inherit fn; };
    proc-macro2-1_0_94-script_build_run-811184542e54f117 = callPackage' ./deps/proc-macro2-1.0.94-script_build_run-811184542e54f117.nix { inherit fn; };
    quote-1_0_39-7726c3a92da25f8b = callPackage' ./deps/quote-1.0.39-7726c3a92da25f8b.nix { inherit fn; };
    rand-0_8_5-3ecba6d7e515d9fc = callPackage' ./deps/rand-0.8.5-3ecba6d7e515d9fc.nix { inherit fn; };
    rand_core-0_6_4-2105b7fc93308a2c = callPackage' ./deps/rand_core-0.6.4-2105b7fc93308a2c.nix { inherit fn; };
    scopeguard-1_2_0-faaabf9a734bce39 = callPackage' ./deps/scopeguard-1.2.0-faaabf9a734bce39.nix { inherit fn; };
    serde-1_0_218-60d80c2d94243f7d = callPackage' ./deps/serde-1.0.218-60d80c2d94243f7d.nix { inherit fn; };
    serde-1_0_218-script_build-6e5c408cc517c124 = callPackage' ./deps/serde-1.0.218-script_build-6e5c408cc517c124.nix { inherit fn; };
    serde-1_0_218-script_build_run-679977d4f26d90fb = callPackage' ./deps/serde-1.0.218-script_build_run-679977d4f26d90fb.nix { inherit fn; };
    siphasher-1_0_1-d737ba0dfb65bc63 = callPackage' ./deps/siphasher-1.0.1-d737ba0dfb65bc63.nix { inherit fn; };
    smallvec-1_14_0-386c45f226217eee = callPackage' ./deps/smallvec-1.14.0-386c45f226217eee.nix { inherit fn; };
    string_cache-0_8_8-a0a8b339a65dd0e5 = callPackage' ./deps/string_cache-0.8.8-a0a8b339a65dd0e5.nix { inherit fn; };
    string_cache_codegen-0_5_4-97d30f50bccc433e = callPackage' ./deps/string_cache_codegen-0.5.4-97d30f50bccc433e.nix { inherit fn; };
    syn-2_0_99-5289b1241fd66725 = callPackage' ./deps/syn-2.0.99-5289b1241fd66725.nix { inherit fn; };
    tendril-0_4_3-0665232631306e47 = callPackage' ./deps/tendril-0.4.3-0665232631306e47.nix { inherit fn; };
    unicode-ident-1_0_18-5783d1ad3b24ccf6 = callPackage' ./deps/unicode-ident-1.0.18-5783d1ad3b24ccf6.nix { inherit fn; };
    utf-8-0_7_6-c2c1c2b0d1dc1271 = callPackage' ./deps/utf-8-0.7.6-c2c1c2b0d1dc1271.nix { inherit fn; };
    xml5ever-0_20_0-956da530969691aa = callPackage' ./xml5ever-0.20.0-956da530969691aa.nix { inherit fn; };
  };
in
self
