{
  pkgs,
  lib,
  ...
}: {
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting = {
      enable = true;
      # Highlight potentially dangerous command
      patterns = {"rm -rf *" = "fg=black, bg=red";};
      highlighters = ["pattern" "brackets" "main"];
    };
  };
}
