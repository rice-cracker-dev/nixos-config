{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    shell.enable = lib.mkEnableOption "enable shell";
  };

  config = lib.mkIf config.shell.enable {
    # zsh
    programs.zsh = {
      # enable zsh
      enable = true;

      # enable oh-my-zsh
      oh-my-zsh.enable = true;

      # enable plugins
      enableCompletion = true;
      autosuggestion.enable = true;

      # enable direnv integration
      initExtra = ''
        eval "$(${lib.getExe pkgs.direnv} hook zsh)"
      '';
    };

    # starship
    programs.starship = {
      # enable starship
      enable = true;
      enableZshIntegration = true;
    };

    # better cd
    programs.zoxide = {
      # enable zoxide
      enable = true;
      enableZshIntegration = true;
      options = [
        "--cmd cd"
      ];
    };

    # shell aliases
    home.shellAliases = {
      nixos-rebuild-flake = "sudo nixos-rebuild switch --flake";
      nixos-update-flake = "nix flake update && sudo nixos-rebuild switch --flake";
    };
  };
}
