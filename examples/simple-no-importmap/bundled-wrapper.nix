{deno2nix}:
deno2nix.mkBundledWrapper {
  pname = "simple-no-importmap-bundled";
  version = "0.1.0";

  src = ./.;
  bin = "simple-no-importmap";

  entrypoint = "./mod.ts";
  lockfile = "./deno.lock";
}
