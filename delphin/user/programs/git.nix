{ ... }:

{
  programs.git = {
    enable = true;
    userName = "Tejas Agarwal";
    userEmail = "tejasagarwalbly@gmail.com";
    extraConfig = {
      init = {
       defaultBranch = "main";
      };
    };
  };
}
