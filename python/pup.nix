{ pkgs ? import <nixpkgs> {} }:

let
  python = pkgs.writeScriptBin "run.sh" ''
    #!${pkgs.stdenv.shell}
    cd /pup
    ${pkgs.python3}/bin/python3 app.py
  '';
in
{
  inherit python;
} 