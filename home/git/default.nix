{
  userName ? null,
  userEmail ? null,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    gh
  ];
  programs.git = {
    enable = true;
    delta.enable = true;
    inherit userName userEmail;
  };
  programs.gitui.enable = true;
  programs.git-cliff.enable = true;

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
    gitCredentialHelper.hosts = ["https://github.com"];
  };
  programs.gh-dash.enable = true;
}
