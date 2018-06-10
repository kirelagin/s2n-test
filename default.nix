{ system ? builtins.currentSystem }:

let
  nixage-commit = "3bcead9642f216d3626a123b6726c77be3f1aab3";
  nixage = import (fetchTarball "https://github.com/kirelagin/nixage/archive/${nixage-commit}.tar.gz") {
    inherit system;
    config = { allowUnfree = true; };
  };
in nixage.buildYamlProject ./.
