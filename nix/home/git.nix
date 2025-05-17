{
  config,
  pkgs,
  ...
}:
{
  enable = true;
  lfs.enable = true;
  userName = "Saladin";
  userEmail = "dev@saladin.pro";

  extraConfig = {
    pull = {
      rebase = true;
    };
    init = {
      defaultBranch = "main";
    };

    # url = {
    #   "git@github.com:" = {
    #     insteadOf = "https://github.com/";
    #   };
    # };
  };
}
