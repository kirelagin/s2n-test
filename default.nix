{ system ? builtins.currentSystem }:

let
  st = import ./stackage.nix {
    inherit system;
    config = { allowUnfree = true; };
    resolver = "lts-107";
    overrides = self: super: {
      hspec-core = dontCheck super.hspec-core;  # tests fail in the sandbox

      async = callHackage "async" "2.2.1" {};
    };
  };

  inherit (st.stackagePackages) callCabal2nix callHackage;
  inherit (st.pkgs.haskell.lib) dontCheck;

in callCabal2nix "s2n-test" ./. {}
