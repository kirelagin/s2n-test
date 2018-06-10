{ system ? builtins.currentSystem }:

let
  nixage-commit = "c42c5b0c9781fb061edf4d60772fb4459b35c4b4";
  nixage = import (fetchTarball "https://github.com/kirelagin/nixage/archive/${nixage-commit}.tar.gz") {
    inherit system;
    config = { allowUnfree = true; };
  };
in nixage.buildYamlProject ./.
