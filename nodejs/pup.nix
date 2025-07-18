{ pkgs ? import <nixpkgs> {} }:

let
  pup_nodejs = pkgs.writeScriptBin "run.sh" ''
    #!${pkgs.stdenv.shell}
    cd /pup
    ${pkgs.nodejs}/bin/node app.js
  '';
in
{
  inherit pup_nodejs;
}
