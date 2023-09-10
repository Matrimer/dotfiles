##### AUDIO (pipewire)
{ config, pkgs, ... }:
{
  hardware.pulseaudio.enable = false;

#  interface.hardware.audio = true;

  security.rtkit.enable = true;
  #sound.enable = true;
  
  services.pipewire = {
    enable = true;
    wireplumber.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
}
