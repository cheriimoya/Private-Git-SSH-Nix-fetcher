{
  description = "NixOS test flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    fetcher.url = "github:cheriimoya/Private-Git-SSH-Nix-fetcher";
  };

  outputs = { self, nixpkgs, fetcher }: let
    pkgs = import nixpkgs {
      system = "x86_64-linux";
      overlays = [ fetcher.overlays ];
    };
  in {
    nixosConfigurations.example-system = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [(
        { pkgs, lib, ... }:
        {
          environment.systemPackages = [
            (pkgs.callPackage ../package.nix {
              inherit lib;
              src = pkgs.fetchPrivateGit {
                version = "1.0";
                sha256 = "sha256-DXBDYcJVa6Pjhl2ep/pzzhwGg8pYyHbOuGZ2typ+5yI="; # If omitted, empty hash will be used
                sshUrl = "git@github.com:cheriimoya/Private-Git-SSH-Nix-fetcher-test-repo.git";
                privateKeyFile = (import ../sshKeyFiles.nix { inherit pkgs; }).key1;
              };
            })
          ];
          system.stateVersion = "23.05";
        }
      )];
      inherit pkgs;
    };
  };
}
