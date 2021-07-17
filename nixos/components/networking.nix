{ ... }:

{
  services.openssh = {
    enable = true;
  };

  networking = {
    hostName = "delphin";
    useDHCP = false;
    interfaces = {
      eno1.useDHCP = true;
      wlp2s0.useDHCP = true;
    };
  };
}
