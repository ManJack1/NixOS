{ config, pkgs, ... }:

{
  networking = {
    hostName = "manjack";
    networkmanager.enable = true;
  };

  services.resolved.enable = true;
}
