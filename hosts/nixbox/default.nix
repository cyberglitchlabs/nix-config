{
  imports = [
    ./hardware-configuration.nix

    ../common/global
    ../common/users/jason
  ];

  networking = {
    hostName = "nixbox";
    useDHCP = true;
  };
  system.stateVersion = "22.05";
}