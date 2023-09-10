# X11 settings
{ config, pkgs, ... }:
{
# From instantnix
  programs.slock.enable = true;
  services.clipmenu.enable = true;
  programs.dconf.enable = true;
  services.gvfs.enable = true;

  services.xserver.displayManager = {
    defaultSession = "none+bspwm";
    startx.enable = true;
  };

  services.xserver.desktopManager = {
    gnome.enable = false;
    plasma5.enable = false;
    xterm.enable = false;
  };


  services.xserver = {
    enable = true;
    layout = "us";

    #exportConfiguration = true; # from instantnix
    #windowManager = {
    #  session = pkgs.lib.singleton {
    #    name = "instantwm";
    #    start = ''
    #    startinstantos &
    #    waitPID=$!
    #    '';
    #  };
    #};

    libinput = {
      enable = true;
      # Disable mouse acceleration
      mouse = {
        accelProfile = "flat";
        };
      # Touchpad
      touchpad = {
        disableWhileTyping = true; # Disable touchpad while typing on keyboard
        naturalScrolling = true; # scrolling up on touchpad scrolls down on screen
        scrollMethod = "twofinger"; # one of “twofinger”, “edge”, “button”, “none”
        tapping = true; # Tap to click
      };
    };
  };
    

# QT/GTK
  #qt.enable = true;



# HiDPI scaling in X11
  #services.xserver.dpi = 180;
  #environment.variables = {
  #  GDK_SCALE = "2";
  #  GDK_DPI_SCALE = "0.5";
  #  _JAVA_OPTIONS = "-Dsun.java2d.uiScale=2";
  #};
}
