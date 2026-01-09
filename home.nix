{ config, pkgs, inputs, ... }:

{
  imports = [
  ];

	home.username = "emil";
	home.homeDirectory = "/home/emil";
	home.stateVersion = "25.11";
	home.packages = with pkgs; [
		qt6.qtwayland
		qt6.qt5compat
		qt6.qtdeclarative
		qt6.qtsvg
	];

	programs.home-manager.enable = true;
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
	programs.neovim = {
		enable = true;
		plugins = [
			pkgs.vimPlugins.nvim-treesitter.withAllGrammars
		];
		defaultEditor = true;
		extraConfig = ''
      filetype plugin on
			set sw=2
			set ts=2
			set sts=2
			set smartindent
			set number
			set ruler
      syntax on
		'';
	};
	home.sessionVariables = {
		QML2_IMPORT_PATH = "${inputs.qml-niri.packages.${pkgs.system}.default}/lib/qt-6/qml";
	};
  home.file.".config/hypr/hyprland.conf".source = ./userConfigs/hyprland.conf;
	home.file.".config/quickshell/shell.qml".source = ./userConfigs/quickshell/shell.qml;
	home.file.".config/quickshell/modules" = {
		source = ./userConfigs/quickshell/modules;
		recursive = true;
	};
}
