{
  lib,
  stdenv,
  fetchFromGitHub,
}:
stdenv.mkDerivation {
  pname = "zellij-themes";
  version = "0.1.0";

  srcs = [
    (fetchFromGitHub {
      owner = "zellij-org";
      repo = "zellij";
      name = "official";
      rev = "c25166c30af05a39f189c7520e3ab0e6a50905be";
      hash = "sha256-b65wuAxPh5OE6DAF59G35bIT658h+Ir0D46kmzVCsyI=";
    })
    (fetchFromGitHub {
      owner = "rose-pine";
      repo = "zellij";
      name = "rp";
      rev = "53835422f965e6c88b9ad59e11d343ca4552bf6d";
      hash = "sha256-VNqd1Qt6LibK7M8KirUhtwpVYAvsgn2e96wAf/YMQzI=";
    })
    (fetchFromGitHub {
      owner = "vic";
      repo = "zellij-rebecca-theme";
      name = "rebecca";
      rev = "11329a8eb7f3b85ae4585ea3f5e62343f612d5be";
      hash = "sha256-z5YgUSl/5s8XY1fm1hpnRAG1owrEIMMGBoGN1Mj6ZJg=";
    })
    (fetchFromGitHub {
      owner = "elvessousa";
      repo = "sobrio-zellij";
      name = "sobrio";
      rev = "ccf26be71cfe9d20796e8c661234443b2b2e10f1";
      hash = "sha256-YL0xDJUtc66rP/ac8v1n/9xe1NtRVrR8f5JYQmaI//8=";
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
