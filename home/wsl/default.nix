{
  config,
  pkgs,
  ...
}: {

  imports = [
    ./../base.nix
  ];

  home.packages = with pkgs; [
    # Languages & runtimes
    gcc-unwrapped
    clang
    python3
    go
    nodejs

    # Lang tools
    gdb
    cmake
    xmake
    uv

  ];

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

}