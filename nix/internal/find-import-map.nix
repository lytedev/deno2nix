{lib}: {
  src,
  config,
  importMap,
}: let
  fallback = {importMap ? null, ...}: importMap;
in
  fallback (lib.importJSON (src + "/${config}"))
