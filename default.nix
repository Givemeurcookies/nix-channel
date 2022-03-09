let
  sources = import ./nix/sources.nix;

  pkgs = import sources.nixpkgs {
    overlays = [
      (self: super: {
        neo4j = super.neo4j.overrideAttrs (old: {
          version = "3.5.14";
          src = super.fetchurl {
            url = "https://neo4j.com/artifact.php?name=neo4j-community-3.5.14-unix.tar.gz";
            sha256 = "1zjb6cgk2lpzx6pq1cs5fh65in6b5ccpl1cgfiglgpjc948mnhzv";
          };
        });
      })
    ];
  };
in pkgs