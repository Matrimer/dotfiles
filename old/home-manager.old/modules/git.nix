{ config, pkgs, ... }:
{
# Git configuration
  programs.git = {
    enable = true;
    # User
    #userEmail = "mats.rimereit@mailbox.org";
    #userName  = "Mats Rimereit";
    # More config options
    #extraConfig = { };
    #hooks = { };
  };
}
