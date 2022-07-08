{
  description = "An example flake demonstrating testing nix functions.";

  inputs = {
    nixpkgs-lib.url = "github:nix-community/nixpkgs.lib";
  };

  outputs = {
    self,
    nixpkgs-lib,
  }:
    import ./. {lib = nixpkgs-lib.lib;};
}
