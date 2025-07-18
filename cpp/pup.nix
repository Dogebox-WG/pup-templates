{ pkgs ? import <nixpkgs> {} }:

let
  cpp_bin = pkgs.stdenv.mkDerivation {
    name = "cpp";
    src = ./.;
    buildPhase = ''
      ${pkgs.gcc14}/bin/g++ -o cpp main.cpp
    '';
    installPhase = ''
      mkdir -p $out/bin
      mv cpp $out/bin/
    '';
  };

  cpp = pkgs.writeScriptBin "run.sh" ''
    #!${pkgs.stdenv.shell}
    ${cpp_bin}/bin/cpp
  '';
in
{
  inherit cpp;
}
