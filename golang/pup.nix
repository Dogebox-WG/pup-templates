{ pkgs ? import <nixpkgs> {} }:

let
  golang_bin = pkgs.buildGoModule {
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

  golang = pkgs.writeScriptBin "run.sh" ''
    #!${pkgs.stdenv.shell}

    cd ${golang_bin}

    ./bin/golang
  '';
in
{
  inherit golang;
}
