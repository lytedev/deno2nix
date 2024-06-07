{deno2nix}:
deno2nix.mkExecutable {
  pname = "simple-no-importmap-executable";
  version = "0.1.0";

  src = ./.;
  bin = "simple-no-importmap";

  entrypoint = "./mod.ts";
  lockfile = "./deno.lock";
  config = "./deno.jsonc";

  allow = {
    all = true;
  };
}
