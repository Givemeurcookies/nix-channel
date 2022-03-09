let
  sources = import ./nix/sources.nix;

  pkgs = import sources.nixpkgs {
    overlays = [
      (self: super: {
        neo4j = super.neo4j.overrideAttrs (old: {
          version = "4.4.4";
          src = super.fetchurl {
            url = "https://neo4j.com/artifact.php?name=neo4j-community-${version}-unix.tar.gz";
            sha256 = "46ea100f162c86284c352fa56606565d6d87ffe5fc9369945914d08728eff2be";
          };
        });
      })
    ];
  };
in pkgs