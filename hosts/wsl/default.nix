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
    ../baseSystem.nix

    ./nvidia.nix
    ../../modules/container/docker.nix
  ];

  nixpkgs.config.allowUnfree = true;

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

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      zlib zstd stdenv.cc.cc curl openssl attr libssh bzip2 libxml2 acl libsodium util-linux xz systemd
    ];
  };

  system.stateVersion = "24.11";
}
