{ pkgs ? import <nixpkgs> {} }:

let
  rust_bin = pkgs.rustPlatform.buildRustPackage {
    pname = "rust";
    version = "0.0.1";
    src = ./.;
    cargoHash = "sha256-QNCtVbXVdXrjajw59aZ/1TV+n7vhSt112ujOjhMaISw=";
  };

  rust = pkgs.writeScriptBin "run.sh" ''
    #!${pkgs.stdenv.shell}
    ${rust_bin}/bin/rust
  '';
in
{
  inherit rust;
}
