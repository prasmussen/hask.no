{ pkgs ? import <nixpkgs> {} }:
let
  src =
    ./.;

  cmd =
    ''
    mkdir -p $out
    cp ${src}/*.html $out/
    cp ${src}/*.css $out/
    '';
in
pkgs.runCommand "gdrive-page" {} cmd
