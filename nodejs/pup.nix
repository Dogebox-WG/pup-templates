{ pkgs ? import <nixpkgs> {} }:

let
  nodejs = pkgs.writeScriptBin "run.sh" ''
    #!${pkgs.stdenv.shell}
    cd /pup
    ${pkgs.nodejs}/bin/node app.js
  '';
in
{
  inherit nodejs;
}
