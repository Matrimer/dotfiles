{ config, pkgs, ... }:
{
# Thermald proactively prevents overheating on intel cpus and work well with other tools.
  services.thermald.enable = true;

# tlp (power management)
  services.tlp = {
    enable = true;
    settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_AC = 90;
        CPU_MIN_PERF_ON_BAT = 0;
        CPU_MAX_PERF_ON_BAT = 80;
        CPU_BOOST_ON_AC=0;
        CPU_BOOST_ON_BAT=0;
      };
    };
    #services.throttled.enable
    #services.throttled.extraConfig = ""
    services.undervolt = {
      enable = false;
      uncoreOffset = -120; # mV offset, signed int
      gpuOffset = -100;
      coreOffset = -120;
      #useTimer = true; # applies settings constantly
}
