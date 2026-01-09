{ config }:
{
  check.enable = true;
  settings.hooks = {
    stylua.enable = true;
    treefmt = {
      enable = true;
      package = config.treefmt.build.wrapper;
    };
  };
}
