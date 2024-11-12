{
  networking = {
    hostName = "khoa-laptop";
    networkmanager.enable = true;
    wireguard.enable = true;
    
    firewall = {
      enable = false;
      allowedTCPPorts = [ 8888 ];
    };
  };
}
