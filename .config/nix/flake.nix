{lib, ...}: {
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nix-darwin,
    nixpkgs,
  } @ inputs: let
    system = "aarch64-darwin";
    username = "borley1211";
    pkgs = import nixpkgs {inherit system;};
  in {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#Mieboris-M4-MacBook-Air
    darwinConfigurations."Mieboris-M4-MacBook-Air" = nix-darwin.lib.darwinSystem {
      system = system;
      modules = [ ./.config/nix/darwin/configulation.nix ];
    };
  };

  src = lib.cleanSourceWith ./.;
}
