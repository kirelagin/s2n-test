{ system ? builtins.currentSystem }:

let
  nixage-commit = "e8c5d305435c386ee6dd48666b13791432ef6028";
  nixage = import (fetchTarball "https://github.com/kirelagin/nixage/archive/${nixage-commit}.tar.gz") {
    inherit system;
  };
in nixage.buildYamlProject ./project.yaml
