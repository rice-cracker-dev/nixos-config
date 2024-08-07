{
  programs.git = {
    enable = true;

    userName = "rice-cracker-dev";
    userEmail = "ricecracker2234@outlook.com";

    extraConfig = {
      http = {
        postBuffer = 157286400;
      };
    };
  };

  programs.gh.enable = true;
}
