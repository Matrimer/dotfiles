{ config, pkgs, ... }:

{
# Home Manager needs a bit of information about you and the
# paths it should manage.
#home.username = "mats";
#home.homeDirectory = "/home/mats";

#home-manager.users.mats = {
#  /* The home.stateVersion option does not have a default and must be set */
#  home.stateVersion = "23.05";
#};


home.sessionPath = [
  "/$HOME/dotfiles/bin"
];

# Let Home Manager install and manage itself.
#programs.home-manager.enable = true;

#home-manager.useUserPackages = true; # packages in /etc/profiles instead of $HOME/.nix-profile
#home-manager.useGlobalPkgs = true;

services.keynav.enable = true;

programs.vscode = {
  enable = true;
  extensions = with pkgs.vscode-extensions; [
    #vscodevim.vim
    #yzhang.markdown-all-in-one
    ms-vscode.cpptools ms-vscode.cmake-tools
  ];
};

programs.emacs = {                              
  enable = true;
  extraPackages = epkgs: [
    epkgs.nix-mode
    epkgs.magit
  ];
};

programs.rofi = {
  enable = true;
  package = pkgs.rofi;
  theme = "gruvbox-dark-hard";
  plugins = [
    pkgs.rofi-power-menu
    pkgs.rofi-calc
    pkgs.rofi-emoji
  ];
  #symlink-dmenu = true;
  location = "top";


  extraConfig =
    {
      modi = "window,drun,combi,emoji,filebrowser,run";
      combi-modi = "window,drun";
    };

};
programs.qutebrowser = {
  enable = true;
  extraConfig =
"config.set('colors.webpage.darkmode.enabled', True)";
};
programs.git = {
  enable = true;
  #package = [ pkgs.gitFull ];
  #aliases = {};
  attributes = [ "*.pdf diff=pdf" ];
  ignores = [ "*~" "*.swp" ];
  userEmail = "mats.rimereit@mailbox.org";
  userName = "Matrimer";
};

programs.neovim = {
  enable = true;
    defaultEditor = true;
#    plugins = [
#      pkgs.vimPlugins.vim-grammarous
#      ];
extraConfig = ''
  set vb
  
  let mapleader = " "

" Compile document, be it groff/LaTeX/markdown/etc.
	map <leader>c :w! \| !compiler "%:p"<CR>

" Open corresponding .pdf/.html or preview
	map <leader>p :!opout "%:p"<CR>
'';
        };
        #programs.rbw.enable = ture; # CLI BItwarden client
        # MPD also available
        # MPV also available
        # TODO: Figure out terminal emulator

      }

