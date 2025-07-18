{ pkgs ? import <nixpkgs> {} }:

let
  pup_golang_bin = pkgs.buildGoModule {
    pname = "golang";
    version = "0.0.1";
    src = ./.;
    vendorHash = null;
    
    buildPhase = ''
      export GO111MODULE=off
      export GOCACHE=$(pwd)/.gocache
      go build golang.go
    '';

    installPhase = ''
      mkdir -p $out/bin
      cp golang $out/bin/
    '';
  };

  pup_golang = pkgs.writeScriptBin "run.sh" ''
    #!${pkgs.stdenv.shell}

    cd ${pup_golang_bin}

    ./bin/golang
  '';
in
{
  inherit pup_golang;
}
