{ self, pkgs }:
let
  inherit (pkgs.lib) getExe;
  check-nix-arg-order = pkgs.writeShellApplication {
    name = "check-nix-arg-order";
    runtimeInputs = [ pkgs.python3 ];
    text = ''exec python3 ${../scripts/check-nix-arg-order.py} "$@"'';
  };
in
{
  src = self;
  hooks = {
    actionlint.enable = true;
    nix-arg-order = rec {
      enable = true;
      name = "nix module argument order";
      package = check-nix-arg-order;
      entry = getExe package;
      files = "\.nix$";
    };
    ghalint = rec {
      enable = true;
      package = pkgs.ghalint;
      entry = "${getExe package} run";
      files = "^\.github/workflows/.*\.(yml|yaml)$";
      pass_filenames = false;
    };
    gitleaks = rec {
      enable = true;
      package = pkgs.gitleaks;
      entry = "${getExe package} git --pre-commit --redact --staged --verbose";
      pass_filenames = false;
    };
    pinact = rec {
      enable = true;
      package = pkgs.pinact;
      entry = "${getExe package} run -min-age 7 -fix=false -verify";
      files = "^\.github/workflows/.*\.(yml|yaml)$";
      pass_filenames = false;
      stages = [ "pre-push" ];
    };
    treefmt = {
      enable = true;
      package = self.formatter.${pkgs.stdenv.hostPlatform.system};
    };
    zizmor.enable = true;
  };
}
