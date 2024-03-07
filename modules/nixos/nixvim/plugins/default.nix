{ ... }:

{
  imports = [
    ./toggleterm
  ];

  programs.nixvim.plugins = {
    chadtree.enable = true;
  };
}

