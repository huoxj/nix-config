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
    xclip
  ];

  home.file.".ssh/authorized_keys".text = builtins.concatStringsSep "\n" myvars.sshpk + "\n";

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