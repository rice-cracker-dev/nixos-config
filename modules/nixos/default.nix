{inputs, ...}: {
  imports = [
    inputs.nur.nixosModules.nur
    ./desktop
    ./dev
    ./os
  ];

  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    auto-optimise-store = true;

    extra-substituters = ["https://cache.garnix.io"];
    extra-trusted-public-keys = ["cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="];
  };

  nixpkgs.config = {
    allowUnfree = true;
    # enableParallelBuildingByDefault = true; # VERY SLOW BUILDING SPEED
  };
}
