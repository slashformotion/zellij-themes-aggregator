{
  lib,
  stdenv,
  fetchFromGitHub,
}: let
  sources = builtins.fromJSON (builtins.readFile _sources/generated.json);
in
  stdenv.mkDerivation {
    pname = "zellij-themes";
    version = "0.1.0";

    srcs = [
      (fetchFromGitHub {
        owner = "zellij-org";
        repo = "zellij";
        name = "official";
        rev = sources.zellij.src.rev;
        hash = sources.zellij.src.sha256;
      })
      (fetchFromGitHub {
        owner = "rose-pine";
        repo = "zellij";
        name = "rp";
        rev = sources.rose-pine.src.rev;
        hash = sources.rose-pine.src.sha256;
      })
      (fetchFromGitHub {
        owner = "vic";
        repo = "zellij-rebecca-theme";
        name = "rebecca";
        rev = sources.rebecca.src.rev;
        hash = sources.rebecca.src.sha256;
      })
      (fetchFromGitHub {
        owner = "elvessousa";
        repo = "sobrio-zellij";
        name = "sobrio";
        rev = sources.sobrio.src.rev;
        hash = sources.sobrio.src.sha256;
      })
    ];

    sourceRoot = ".";
    buildPhase = ''
    '';

    installPhase = ''
      mkdir -p $out/etc/zellij/themes/
      mv official/zellij-utils/assets/themes/* $out/etc/zellij/themes/
      mv rp/dist/* $out/etc/zellij/themes/
      mv rebecca/rebecca.kdl $out/etc/zellij/themes/
      mv sobrio/sobrio.kdl $out/etc/zellij/themes/
    '';

    meta = with lib; {
      description = "Aggregator of zellij themes. Refreshed daily";
      license = licenses.gpl3Plus;
      platforms = platforms.all;
    };
  }
