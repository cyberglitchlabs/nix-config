{ outputs, lib, config, ... }:

let
  inherit (config.networking) hostName;
in
{
  services.openssh = {
    enable = true;
    settings = {
      # Harden
      PasswordAuthentication = true;
      PermitRootLogin = "no";
      # Automatically remove stale sockets
      StreamLocalBindUnlink = "yes";
      # Allow forwarding ports to everywhere
      GatewayPorts = "clientspecified";
    };

  };

  # Passwordless sudo when SSH'ing with keys
  security.pam.enableSSHAgentAuth = true;
}