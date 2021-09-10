{ ... }:

{
  programs.starship = {
    enable = true;

    settings = {
      character = {
        success_symbol = "[λ](bold green)";
        error_symbol = "[λ](bold red)";
      };
      # line_break = {
      #  disabled = true;
      # }; 
    };
  };
}
