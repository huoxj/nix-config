# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{
  config,
  lib,
  pkgs,
  myvars,
  ...
}: let
  hostname = "wsl-nixos";
in {
  imports = [
    ./../../modules/baseSystem.nix

    ./../../modules/container/podman.nix
  ];

  wsl = {
    enable = true;
    defaultUser = myvars.username;
    wslConf.automount.root = "/mnt";
  };

  networking.hostName = hostname;
  services.openssh = {
    enable = true;
    ports = [ 22222 ];
  };

  programs.nix-ld.enable = true;

  system.stateVersion = "24.11";
}