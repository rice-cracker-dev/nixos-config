{ ... }:

{
  # enable usb modeswitch (for android usb tethering)
  hardware.usb-modeswitch.enable = true;

  # enable networking
  networking.networkmanager.enable = true; 
  networking.hostName = "nixos"; # Define your hostname.

  # enable bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
}

