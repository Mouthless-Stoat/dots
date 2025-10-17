{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  nixpkgs.config.allowUnfreePredicate =
    pkgs:
    builtins.elem (lib.getName pkgs) [
      "steam"
      "steam-original"
      "steam-unwrapped"
      "steam-run"
      "steamcmd"
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
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # enable flakes and stuff
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # system package to be use in root
  environment.systemPackages = with pkgs; [
    git
    vim
    wget

    nixfmt-rfc-style
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.caskaydia-cove
  ];

  fonts.fontconfig.defaultFonts =
    let
      cascadia = [ "Caskaydia Cove Nerd Font Mono" ];
    in
    {
      serif = cascadia;
      sansSerif = cascadia;
      monospace = cascadia;
      emoji = cascadia;
    };

  programs.dconf.enable = true;
  programs.steam.enable = true;

  system.stateVersion = "25.05"; # DO NOT CHANGE THIS MANUALLY
}
