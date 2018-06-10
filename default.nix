{ system ? builtins.currentSystem }:

let
  nixage-commit = "52d120192b17da55176ac607b386e108a13dddba";
  nixage = import (fetchTarball "https://github.com/kirelagin/nixage/archive/${nixage-commit}.tar.gz") {
    inherit system;
    config = { allowUnfree = true; };
  };
in nixage.buildYamlProject ./.
