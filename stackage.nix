{ system, config ? {}, resolver, overrides ? (_: _: {}) }:

let
  bootstrap = import <nixpkgs> {};
  fetchGitHubJSON = file:
    let commit = builtins.fromJSON (builtins.readFile file);
    in import (bootstrap.fetchFromGitHub commit);

  pkgs = fetchGitHubJSON ./nixpkgs.json {
    inherit system config;
    overlays = [ (fetchGitHubJSON ./stackage.json ) ];
  };

  useNewCabal = self: super:{
    #Cabal = pkgs.haskellPackages.Cabal_2_2_0_1;
  };

in {
  inherit pkgs;
  stackagePackages = pkgs.haskell.packages.stackage."${resolver}".override {
    overrides = pkgs.lib.composeExtensions useNewCabal overrides;
  };
}
