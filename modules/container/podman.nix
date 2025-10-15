{ pkgs, lib, ... }:
{
  # Enable common container config files in /etc/containers
  virtualisation = {
    containers.enable = true;
    oci-containers.backend = "podman";

    podman = {
      enable = true;
      # Docker alias
      dockerCompat = true;
      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  # Useful other development tools
  environment.systemPackages = with pkgs; [
    # dive # look into docker image layers
    podman-tui # status of containers in the terminal
    podman-compose # start group of containers for dev
  ];

  # Registry mirrors
  environment.etc."containers/registries.conf".source = lib.mkForce ./registries.conf;

}