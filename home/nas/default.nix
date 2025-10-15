{
  config,
  pkgs,
  myvars,
  ...
}: {

  imports = [
    ./../base.nix
  ];

  home.packages = with pkgs; [
    # Languages & runtimes
    gcc
    python3
    nodejs

    # Lang tools
    cmake
    uv

    # Utilities
    lm_sensors

  ];

}