{ pkgs, lib, ... }:
{
  virtualisation.docker = {
    enable = true;
    daemon.settings = {
      features.cdi = true;
    };
  };
  hardware = {
    nvidia = {
      modesetting.enable = true;
      nvidiaSettings = false;
      open = false;
    };
    nvidia-container-toolkit.enable = true;
  };
  services.xserver.videoDrivers = ["nvidia"];
    environment.shellInit = ''
    export LD_LIBRARY_PATH="/run/current-system/sw/share/nix-ld/lib:/usr/lib/wsl/lib:$LD_LIBRARY_PATH"
  '';
}