{ pkgs ? import <nixpkgs> {} }:

let
  pup_c_bin = pkgs.stdenv.mkDerivation {
    name = "c";
    src = ./.;
    buildPhase = ''
      gcc -o c main.c
    '';
    installPhase = ''
      mkdir -p $out/bin
      mv c $out/bin/
    '';
  };

  pup_c = pkgs.writeScriptBin "run.sh" ''
    #!${pkgs.stdenv.shell}
    ${c_bin}/bin/c
  '';
in
{
  inherit pup_c;
} 
