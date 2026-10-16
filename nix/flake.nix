{
  description = "chaotic_nylo's NixOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }@inputs:
    let
      mkHost = hostname: nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };   # lets any module use `inputs`
        modules = [
          ./hosts/${hostname}                # loads hosts/<name>/default.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;          # HM uses system pkgs (unfree etc.)
              useUserPackages = true;        # HM packages install to the user profile
              backupFileExtension = "backup";
              extraSpecialArgs = { inherit inputs; };
              users.chaotic_nylo = import ./modules/home;
            };
          }
        ];
      };
    in {
      nixosConfigurations = {
        pc = mkHost "pc";
        laptop = mkHost "laptop";
      };
    };
}
