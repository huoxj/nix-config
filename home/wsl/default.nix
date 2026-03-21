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
    clang-tools
    bear
    uv

    (pkgs.buildFHSEnv {
      name = "pixi";
      runScript = "pixi";
      targetPkgs = pkgs: with pkgs; [ pixi ];
    })

  ];

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

}
