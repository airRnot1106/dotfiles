{ self, pkgs }:
let
  inherit (pkgs.lib) getExe;
in
{
  src = ./.;
  hooks = {
    gitleaks = rec {
      enable = true;
      package = pkgs.gitleaks;
      entry = "${getExe package} git --pre-commit --redact --staged --verbose";
      pass_filenames = false;
    };
    treefmt = {
      enable = true;
      package = self.formatter.${pkgs.stdenv.hostPlatform.system};
    };
  };
}
