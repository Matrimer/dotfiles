{ config, pkgs, ... }:
with pkgs;
let
#  unstable = import
#    (builtins.fetchTarball https://github.com/nixos/nixpkgs/tarball/commit)
#    # reuse the current configuration
#    { config = config.nixpkgs.config; };        
#  unstablePackages = import unstableTarball { config = pkgs.config; inherit system; };
#  unstable = import <nixpkgs-unstable> { config = { allowUnfree = true; }; };
RStudio-with-packages = rstudioWrapper.override { packages = with rPackages; [ ggplot2 dplyr xts rmarkdown tinytex readxl Rcpp tidyverse ggbeeswarm]; };
R-with-packages       = rWrapper.override       { packages = with rPackages; [ ggplot2 dplyr xts rmarkdown tinytex readxl Rcpp tidyverse ggbeeswarm]; };
in
  {
# Nix User Repository (NUR)
  nixpkgs.config.packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    };
  };

  
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
###############################################
    RStudio-with-packages
    R-with-packages
    dia # Diagrams for imndb

    libreoffice

    wxGTK32 #for charles

    cmake
    cmakeCurses

    unzip
    freetube

    spotify


    # Wayland
    wl-clipboard
    ydotool
    grim #screenshot util
    slurp # screen selection
    wbg # wayland background
    ## WAYBAR
    (waybar.overrideAttrs (oldAttrs: { mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true "]; }))
    
    networkmanagerapplet

    pinentry-rofi
    pinentry
    rofi-bluetooth
   
    gitFull
    vim-full
    # vimPlugins.vim-grammarous Needs fix
    wget
    curl
    lynx
    ventoy-full
    zathura
    vlc
    gnumake gcc pkg-config zlib
    pandoc
    pkgs.texlive.combined.scheme-full
    nsxiv
    keynav
    slock


# instantnix
    gnupg screen tree file
    fasd fzf direnv
    inetutils dnsutils nmap openssl mkpasswd
    flameshot
    gitAndTools.git git-lfs
    #nix-prefetch-scripts nix-update nixpkgs-review cachix
    papirus-icon-theme arc-theme
    (neovim.override {viAlias = true; vimAlias = true;})


# System tools
    ntfs3g
    usbutils
    powertop
    htop
    
    #busybox
    rs # reshape data array
    jupp # mirBSD variant of Joe's Own Editor
    mksh # MirBSD Korn Shell
    wev
    nix-index
    libqalculate

    python3Full

# Games
    #steamcontroller
    sc-controller

    openttd
    simutrans
    openrct2
    endless-sky
    freeciv_qt
    #freeciv
    unciv
    widelands
    pioneer
    pioneers
    itch
    bsdgames
    gamehub
    lutris
    boohu
    taisei
    gzdoom

# Security
    bitwarden
    bitwarden-cli
    rbw # cli bitwarden client
    rofi-rbw

# Email
    thunderbird
    #astroid
    #notmuch

# Multimedia
    ffmpeg-full
    mpv
    mpvc
    kaffeine

    mpd
    mpc-cli
    ncmpcpp

# pipewire stuff
    lxqt.pavucontrol-qt
    ncpamixer

# Terminal emulators
    rxvt-unicode
    kitty

# wm stuff
    rofi
    rofi-systemd
    pkgs.networkmanagerapplet


##### web
    netsurf.browser
    nyxt
    #qutebrowser
    webmacs
    vimb
    luakit
    tor-browser-bundle-bin
    firefox
    
    i2pd
	
    open-in-mpv
    
    nix-prefetch-scripts nix-update nixpkgs-review cachix
    #nur.repos.instantos.instantnix


# Compatibility:
    libpulseaudio alsa-lib glibc
  ];
  programs.kdeconnect.enable = true;

}
