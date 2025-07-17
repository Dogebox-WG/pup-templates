{ pkgs ? import <nixpkgs> {} }:

let
  nextjs-src = ./.;

  nextjs-prod = pkgs.buildNpmPackage {
    pname = "nextjs";
    version = "1.0.0";
    src = nextjs-src;

    npmDepsHash = "sha256-ptCBw0rEXlbmspnEblu7UUFTT9BdVc+SHJ5UkbP4WXM=";

    buildPhase = ''
      npm install
      npm run build
    '';

    installPhase = ''
      mkdir -p $out
      cp -r . $out/
    '';
  };

  nextjs-dev = pkgs.writeScriptBin "run.sh" ''
    #!${pkgs.stdenv.shell}
    cd /pup

    export PORT=8080
    export HOSTNAME=0.0.0.0

    export PATH=${pkgs.nodejs_22}/bin:${pkgs.bash}/bin:$PATH

    npm install && \
    npm rebuild && \
    npm run dev -- -p $PORT -H $HOSTNAME
  '';

  nextjs = pkgs.writeScriptBin "run.sh" ''
    #!${pkgs.stdenv.shell}

    cd ${nextjs-prod}

    export NODE_ENV=production
    export PORT=8080
    export HOSTNAME=0.0.0.0

    ${pkgs.nodejs_22}/bin/node ${nextjs-prod}/node_modules/.bin/next start -p $PORT -H $HOSTNAME
  '';

in
{
  inherit nextjs nextjs-dev;
}
