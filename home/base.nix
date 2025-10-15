{
  config,
  pkgs,
  myvars,
  ...
} : {

  imports = [
    ../modules/dotfile.nix
  ];

  home = {
    stateVersion = "24.11";
    username = myvars.username;
    homeDirectory = "/home/${myvars.username}";
  };

  home.packages = with pkgs; [
    watch
  ];

  programs.git = {
    enable = true;
    userName = "huoxj";
    userEmail = "2567499168@qq.com";
  };
  
  programs.zsh = {
    enable = true;
    initContent = builtins.readFile ./.baseZshrc;
  };

}