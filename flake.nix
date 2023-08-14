{
  description = "Nix fetcher for private git repos reachable via ssh";
  outputs = { self, nixpkgs }: {
    lib = {
      fetchPrivateGit = import ./fetcher.nix;
    };
    overlays = final: prev: {
      fetchPrivateGit = final.callPackage ./fetcher.nix;
    };
  };
}
