{ system ? builtins.currentSystem }:

let
  nixage-commit = "7d96458eb92f077b409eb7cb5c30fc5feadf2272";
  nixage = import (fetchTarball "https://github.com/kirelagin/nixage/archive/${nixage-commit}.tar.gz") {
    inherit system;
    config = { allowUnfree = true; };
    overrides = self: super: {
      base-noprelude = nixage.pkgs.haskell.lib.dontHaddock (super.base-noprelude);
      hspec-core = nixage.pkgs.haskell.lib.dontCheck (super.hspec-core);  # fails in sandbox
      tasty-discover = nixage.pkgs.haskell.lib.dontCheck (super.tasty-discover);  # fails
    };
  };
in nixage.buildYamlProject ./.
