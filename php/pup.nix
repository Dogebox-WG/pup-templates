{ pkgs ? import <nixpkgs> {} }:

let
  php = pkgs.writeScriptBin "run.sh" ''
    #!${pkgs.stdenv.shell}
    cd /pup

    ${pkgs.frankenphp}/bin/frankenphp php-server -r . -l 0.0.0.0:8080
  '';
in
{
  inherit php;
}
