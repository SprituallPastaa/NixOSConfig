{ config, pkgs, inputs, ... }:

{
  imports = [
  ];

	home.username = "emil";
	home.homeDirectory = "/home/emil";
	home.stateVersion = "25.11";

	programs.git.enable = true;
	programs.bash = {
			enable = true;
      initExtra = ''
        fastfetch
      '';
			shellAliases = {
					btw = "echo i use nixos btw";
          nrs = "sudo nixos-rebuild switch --flake /home/emil/.dotfiles";
			};
	};
	programs.vim = {
		enable = true;
		defaultEditor = true;
		extraConfig = ''
      filetype plugin on
			set sw=2
			set ts=2
			set sts=2
			set smartindent
			set number
      syntax on
		'';
	};
  home.file.".config/hypr/hyprland.conf".source = ./userConfigs/hyprland.conf;
}
