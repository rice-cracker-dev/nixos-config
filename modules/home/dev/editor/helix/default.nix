{
  imports = [./themes.nix];

  programs.helix = {
    enable = true;

    settings = {
      theme = "base16";
    };
  };
}
