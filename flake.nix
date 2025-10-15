{
  description = "Runz's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixos-wsl, ... } @ inputs: let
    system = "x86_64-linux";
    myvars = import ./vars/common.nix;
    specialArgs = {
      inherit myvars;
    };
    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
      };
    };
  in {
    nixosConfigurations = {
      wsl = nixpkgs.lib.nixosSystem {
        inherit system;
        inherit specialArgs;

        modules = [
          nixos-wsl.nixosModules.wsl
          ./hosts/wsl
        ];
      };

      nas = nixpkgs.lib.nixosSystem {
        inherit system;
        inherit specialArgs;

        modules = [
          ./hosts/nas
        ];
      };
    };

    homeConfigurations = {
      wsl = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = inputs // specialArgs;
        modules = [
          ./home/wsl
        ];
      };

      nas = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = inputs // specialArgs;
        modules = [
          ./home/nas
        ];
      };
    };
  };
}