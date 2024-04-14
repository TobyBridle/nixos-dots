{ pkgs
, ...
}: {
  programs.zsh = {
    enable = true;
    autocd = true;
    plugins = [
      {
        name = "fzf-tab";
        src = pkgs.fetchFromGitHub {
          owner = "Aloxaf";
          repo = "fzf-tab";
          rev = "c2b4aa5ad2532cca91f23908ac7f00efb7ff09c9";
          sha256 = "sha256-gvZp8P3quOtcy1Xtt1LAW1cfZ/zCtnAmnWqcwrKel6w=";
        };
      }
    ];
    "oh-my-zsh" = {
      enable = true;
      plugins = [
        "fzf"
        "gh"
        "git"
        "history"
        "history-substring-search"
        "ripgrep"
        "zoxide"
      ];
    };
    history = {
      path = "$HOME/.cache/zsh_history";
      save = 10000;
      share = true;
    };
    historySubstringSearch = {
      enable = true;
    };
    initExtra =
      builtins.concatStringsSep "\n" [
        (builtins.readFile ./zshrc)
      ];
  };
  home.packages = with pkgs; [
    zoxide
    starship
    eza
    fzf
  ];
}
