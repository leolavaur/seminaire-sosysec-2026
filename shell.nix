{pkgs, ...}: let
  fonts = pkgs.symlinkJoin {
    name = "fonts";
    paths = [
      pkgs.fira
      pkgs.fira-code
      pkgs.python3Packages.pygments
    ];
  };
in
  pkgs.mkShellNoCC {
    OSFONTDIR = "${fonts}/share/fonts";

    buildInputs = with pkgs; [
      texliveFull
      tex-fmt
    ];
  }
