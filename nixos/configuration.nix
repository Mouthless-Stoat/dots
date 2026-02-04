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

  nix.settings.trusted-users = [ "mouthless" ];
  boot = {
    binfmt.emulatedSystems = [
      "aarch64-linux"
    ];
  };

  nixpkgs.config.allowUnfreePredicate =
    pkgs:
    builtins.elem (lib.getName pkgs) [
      "nvidia-x11"
      "nvidia-settings"
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

  time.timeZone = "Canada/Atlantic";
  i18n.defaultLocale = "en_CA.UTF-8";

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
    fira-math
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

  services.upower.enable = true;

  # nvidia bullshit

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;

    open = true;

    nvidiaSettings = true;

    package = config.boot.kernelPackages.nvidiaPackages.stable;

    prime = {
      intelBusId = "PCI:0@0:2:0";
      nvidiaBusId = "PCI:1@0:0:0";
    };
  };
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.graphics = {
    enable = true;

    enable32Bit = true;
  };

  system.stateVersion = "25.05"; # DO NOT CHANGE THIS MANUALLY
}
