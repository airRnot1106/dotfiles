{ inputs, pkgs, ... }:
let
  textlint-filter-rule-comments =
    inputs.nur-packages.packages.${pkgs.stdenv.hostPlatform.system}.textlint-filter-rule-comments;
  textlint-rule-preset-ai-writing =
    inputs.nur-packages.packages.${pkgs.stdenv.hostPlatform.system}.textlint-rule-preset-ai-writing;

  textlint = pkgs.textlint.withPackages (
    with pkgs;
    [
      textlint-filter-rule-comments
      textlint-rule-preset-ai-words-ja
      textlint-rule-preset-ai-writing
      textlint-rule-preset-ja-spacing
      textlint-rule-preset-ja-technical-writing
      textlint-rule-terminology
    ]
  );
in
{
  home.packages = [ textlint ];
}
