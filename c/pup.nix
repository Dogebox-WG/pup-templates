{ pkgs ? import <nixpkgs> {} }:

let
  c_bin = pkgs.stdenv.mkDerivation {
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

  c = pkgs.writeScriptBin "run.sh" ''
    #!${pkgs.stdenv.shell}
    ${c_bin}/bin/c
  '';
in
{
  inherit c;
} 
