{
  config,
  pkgs,
  myvars,
  ...
}: {

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];

    trusted-users = [ myvars.username ];

    substituters = [
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
      "https://mirrors.ustc.edu.cn/nix-channels/store"
      "https://cache.nixos.org/"
    ];

  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  time.timeZone = "Asia/Shanghai";
  i18n.defaultLocale = "en_US.UTF-8";

  environment.systemPackages = with pkgs; [
    neovim
    tmux
    git
    git-lfs

    # utilities
    htop
    lsof
    home-manager

    # tools
    unzip

    # networking
    curl
    wget
    inetutils

    # misc
    neofetch
    which
  ];

  services.cron.enable = true;
  services.openssh.enable = true;

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
  };

  programs.zsh = {
    enable = true;
    ohMyZsh = {
      enable = true;
      theme = "avit";
      plugins = [ "git" "z" "sudo" ];
    };
    autosuggestions.enable = true;
  };

  users.users."${myvars.username}" = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    openssh.authorizedKeys.keys = myvars.sshpk;
    shell = pkgs.zsh;
  };

}