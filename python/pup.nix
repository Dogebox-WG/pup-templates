{ pkgs ? import <nixpkgs> {} }:

let
  pup_python = pkgs.writeScriptBin "run.sh" ''
    #!${pkgs.stdenv.shell}
    cd /pup
    ${pkgs.python3}/bin/python3 app.py
  '';
in
{
  inherit pup_python;
}
