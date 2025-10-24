{
  config,
  pkgs,
  ...
}:
{
  enable = true;
  lfs.enable = true;

  settings = {
    user.name = "Saladin";
    user.email = "dev@saladin.pro";
    pull = {
      rebase = true;
    };
    init = {
      defaultBranch = "main";
    };
  };
}
