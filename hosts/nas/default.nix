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
  hostname = "nas-nixos";
in {
  imports = [
    ./hardware-configuration.nix
    ../baseSystem.nix

    ../../modules/container/docker.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = hostname;
  networking.firewall.enable = false;

  programs.nix-ld.enable = true;

  system.stateVersion = "25.05";
}
