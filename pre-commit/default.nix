{ pkgs, config }:
{
  check.enable = true;
  settings.hooks = {
    actionlint.enable = true;
    ghalint = {
      enable = true;
      entry = "${pkgs.lib.getExe pkgs.ghalint} run";
      files = "^\\.github/workflows/.*\\.ya?ml$";
      pass_filenames = false;
    };
    ghalint-action = {
      enable = true;
      entry = "${pkgs.lib.getExe pkgs.ghalint} act";
      files = "^\\.github/actions/.*/action\\.ya?ml$";
      pass_filenames = true;
    };
    pinact = {
      enable = true;
      entry = "${pkgs.lib.getExe pkgs.pinact} run -u --min-age 7";
      files = "^\\.github/workflows/.*\\.ya?ml$";
      pass_filenames = true;
    };
    stylua.enable = true;
    treefmt = {
      enable = true;
      package = config.treefmt.build.wrapper;
    };
  };
}
