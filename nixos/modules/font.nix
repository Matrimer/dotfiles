# X11 settings
{ config, pkgs, ... }:
{
fonts.fonts = with pkgs; [
  noto-fonts
  noto-fonts-cjk
  noto-fonts-emoji
  liberation_ttf
  fira-code
  fira-code-symbols
  mplus-outline-fonts.githubRelease
  dina-font
  proggyfonts
  cantarell-fonts
  fira-code-symbols
  dina-font
  joypixels
  (nerdfonts.override { fonts = [ "FiraCode" "FiraMono" ]; })

];
}
