{ system ? builtins.currentSystem }:

let
  nixage = import ../nixage {
    inherit system;
    config = { allowUnfree = true; };
    overrides = self: super: {
      base-noprelude = nixage.pkgs.haskell.lib.dontHaddock (super.base-noprelude);
      hspec-core = nixage.pkgs.haskell.lib.dontCheck (super.hspec-core);  # fails in sandbox
      tasty-discover = nixage.pkgs.haskell.lib.dontCheck (super.tasty-discover);  # fails
    };
  };
in nixage.buildYamlProject ./.
