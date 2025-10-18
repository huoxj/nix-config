{ pkgs, lib, myvars, ... }:
{
  virtualisation = {
    docker = {
      enable = true;
      daemon.settings = {
        "registry-mirrors"= [
          "https://docker.1ms.run"
          "https://docker.mybacc.com"
          "https://dytt.online"
          "https://lispy.org"
          "https://docker.xiaogenban1993.com"
          "https://docker.yomansunter.com"
          "https://aicarbon.xyz"
          "https://666860.xyz"
          "https://docker.zhai.cm"
          "https://a.ussh.net"
          "https://hub.littlediary.cn"
          "https://hub.rat.dev"
          "https://docker.m.daocloud.io"
          "https://dockerproxy.net"
        ];
      };
    };
    oci-containers.backend = "docker";
  };

  users.extraGroups.docker.members = [ "${myvars.username}" ];

}