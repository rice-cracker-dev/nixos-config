{
  imports = [
    ./desktop
    ./dev
    ./os
  ];

  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;
    };
  };

  nixpkgs.config.allowUnfree = true;
}
