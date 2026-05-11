{
  description = "dotfiles managed with Nix + Home Manager";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dendrite = {
      url = "github:sivchari/dendrite";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, dendrite, ... }:
    let
      supportedSystems = [
        "aarch64-darwin"
        "x86_64-linux"
        "aarch64-linux"
      ];
    in
    {
      homeConfigurations = builtins.listToAttrs (map (system: {
        name = system;
        value = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          extraSpecialArgs = {
            dendrite = dendrite.packages.${system}.default;
          };
          modules = [ ./nix/home.nix ];
        };
      }) supportedSystems);

      packages = builtins.listToAttrs (map (system: {
        name = system;
        value = {
          dendrite = dendrite.packages.${system}.default;
        };
      }) supportedSystems);
    };
}
