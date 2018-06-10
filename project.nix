{
  name = "s2n";
  path = ./.;

  resolver = "lts-10.7";
  nixpkgs = {
    url = "https://github.com/NixOS/nixpkgs.git";
    rev = "d0b24f28fa364ff758f86f2f742f80e0f0e603a2";
    sha256 = "0hmw0wf4h5aqlzc9ag3xxqr0wcxdaa7p23scbnqixs2b488aj48r";
  };

  extra-deps = {
    "async" = "2.2.1";
    "base-noprelude" = "4.10.1.0";
    "caps" = {
      git = "https://github.com/int-index/caps.git";
      rev =  "2f46fc6d5480bdef0a17f64359ad6eb29510dba4";
      sha256 = "0dz7scllns15d9zbjsgzlp379kcyqzq65qggr2s924skinzz4470";
    };
    "dependent-sum" = {
      git = "https://github.com/mokus0/dependent-sum.git";
      rev =  "f8909cb323b4ffa63af6c4e7cb3a9745e6199080";
      sha256 = "0a3ilj6qr4b6abv10l8z1dlllf3aw8ap0ll12zxxm3zqn4n3z2i5";
    };
  };
}