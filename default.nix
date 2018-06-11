{ system ? builtins.currentSystem }:

let
  nixage-commit = "df6c3d5afba513af95929e1b8e6ae3d6ab5f6656";
  nixage = import (fetchTarball "https://github.com/kirelagin/nixage/archive/${nixage-commit}.tar.gz") {
    inherit system;
  };
in nixage.buildYamlProject ./.
