{
  description = "rice-cracker-dev's personal flakes";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # use nix-colors to handle colorschemes
    nix-colors.url = "github:misterio77/nix-colors";

    # editor
    neovim-flake.url = "github:NotAShelf/neovim-flake";

    # hyprwm
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    # aylur gtk shell
    ags.url = "github:Aylur/ags";

    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # spicetify
    spicetify.url = "github:the-argus/spicetify-nix";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    lib = nixpkgs.lib;
    username = "khoa";
  in {
    nixosConfigurations = {
      laptop = lib.nixosSystem {
        specialArgs = {inherit inputs username;};
        modules = [
          ./hosts/laptop/nixos/configuration.nix
        ];
      };
    };
  };
}
