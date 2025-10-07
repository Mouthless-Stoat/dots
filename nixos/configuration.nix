{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # boot option
  # this use grub so i can also dual boot window :D
  boot.loader = {
    systemd-boot.enable = false;

    grub = {
      enable = true;
      device = "nodev";
      useOSProber = true;
      efiSupport = true;
    };

    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
  };
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.networkmanager.enable = true; # use network manager to handle internet
  hardware.bluetooth.enable = true; # enable bluetooth

  time.timeZone = "Etc/GMT+3";

  # default user pog
  users.users.mouthless = {
    isNormalUser = true;
    initialPassword = "mouthless";
    extraGroups = [ "wheel" ];
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # enable flakes and stuff
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # system package to be use in root
  environment.systemPackages = with pkgs; [
    git
    vim
    wget
  ];
  

  system.stateVersion = "25.05"; # DO NOT CHANGE THIS MANUALLY
}
# vi:et:ts=2
