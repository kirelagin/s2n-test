{ system ? builtins.currentSystem }:

let
  nixage-commit = "aa5598fec7af3ab1515b59f00714e37e1a5b7efe";
  nixage = import (fetchTarball "https://github.com/kirelagin/nixage/archive/${nixage-commit}.tar.gz") {
    inherit system;
    overrides = self: super: {
      base-noprelude = nixage.pkgs.haskell.lib.dontHaddock (super.base-noprelude);
    };
  };
in nixage.buildYamlProject ./project.yaml
