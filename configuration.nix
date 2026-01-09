{ config, lib, pkgs, inputs, system, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos"; # Define your hostname.

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Stockholm";

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
	services.upower.enable = true;

  users.users.emil= {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
  };

  services.getty.autologinUser = "emil";

	services.displayManager.ly.enable = true;


	# services.displayManager.gdm = {
	# 	enable = true;
	# 	wayland = true;
	# };


  programs.firefox.enable = true;
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  programs.niri.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    foot
    wofi
    fuzzel
    wl-clipboard
    grim
    slurp
    swaybg
    hyprlauncher
    fastfetch
    bibata-cursors
    xwayland-satellite
    neovim
		swww
  ]
  ++ [
    inputs.matugen.packages."x86_64-linux".default
		inputs.quickshell.packages.${system}.default
		inputs.qml-niri.packages.${system}.default
  ];


  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  virtualisation.vmware.guest.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  system.stateVersion = "25.11";

}

