{ pkgs ? import <nixpkgs> {} }:

let
  pup_cpp_bin = pkgs.stdenv.mkDerivation {
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

  pup_cpp = pkgs.writeScriptBin "run.sh" ''
    #!${pkgs.stdenv.shell}
    ${pup_cpp_bin}/bin/cpp
  '';
in
{
  inherit pup_cpp;
}
