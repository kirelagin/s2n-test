{ system ? builtins.currentSystem }:

let
  nixage-commit = "eab733498b1511e485abfc9953bd82631661dd9b";
  nixage = import (fetchTarball "https://github.com/kirelagin/nixage/archive/${nixage-commit}.tar.gz") {
    inherit system;
  };
in nixage.buildYamlProject ./.
