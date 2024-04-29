{
  username,
  inputs,
  ...
}: {
  imports = [
    "${inputs.self}/modules/home"
    "${inputs.self}/modules/extends/serene/home"
  ];

  home = {
    username = username;
    homeDirectory = "/home/${username}";

    sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };

    stateVersion = "24.05";
  };

  programs.home-manager.enable = true;
}
