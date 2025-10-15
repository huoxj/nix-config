{
  username = "runz";
  sshpk = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKqcPWYedUyND04KJup7KGPbu9BGNM8klvFbx8rD8cdi runz"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDAbw2j+lHnWtfbQWyevcvJYsOUj812UBusxTBilN0SYuQ3yhjiVNoKAptX1JjQXHQajL0tq6mMp+Y69LLqWasaLV4LJsmyMs4vayDGYQKjqIch0HS+Ou7gIs8algWbPJi2ru6Akq882CKQC+8Q/baluHQPwd9HgX/H2Ygd+Jc3IpMZNFqrUSJW5rAdbnyz2jSg0EiCGtfQt/FQzf5EP9OI2X7sEATALsKLkmf74fJJxgHWlYPZellmOThyp8Uz6jTRAZnVRe05pVMQXOTkGBeRSxbogFtOZFw+QDUGSh8Wizsemy/KEp8voU4K4wCAURKH7WUvEJX/+yvhysgyBXTPQT5fdfyeuXcjcrH6okSZLcs6o5exjSYiNLvnf8nwGcbPC3op9oQr9yacM/zFhFUlE2+0MhIDWyMd7Y41/Vp6gg6lJzYloCQ8Ct5HKcuVeOeIWb5jKox4YRHlBsaPJpTcG2GDRPuHB+jtS7EBKFwvLtfP+cK3hXFJVBVyu84xdS8= runz-rsa"
  ];
  dotfiles = {
    repo = "https://github.com/huoxj/Dotfiles.git";
    homepath = ".dotfiles";
  };
}