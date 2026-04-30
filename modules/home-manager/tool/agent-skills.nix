{
  inputs,
  lib,
  ...
}:
let
  inherit (inputs) agent-skills skills;
  inherit (skills)
    anthropic-skills
    find-skills
    mizchi
    opensrc
    vercel-skills
    ;
in
{
  imports = [
    (import "${agent-skills.outPath}/modules/home-manager/agent-skills.nix" {
      inherit lib;
      inputs = { };
    })
  ];

  programs.agent-skills = {
    enable = true;
    sources = {
      anthropic = {
        path = anthropic-skills;
        subdir = "skills";
      };
      find-skills = {
        path = find-skills;
        subdir = "skills";
      };
      mizchi = {
        path = mizchi;
      };
      opensrc = {
        path = opensrc;
        subdir = "skills";
      };
      vercel = {
        path = vercel-skills;
        subdir = "skills";
      };
    };
    skills.enable = [
      # anthropic
      "doc-coauthoring"
      "docx"
      "frontend-design"
      "internal-comms"
      "pdf"
      "pptx"
      "skill-creator"
      "webapp-testing"
      "xlsx"
    ]
    ++ [
      # find-skills
      "find-skills"
    ]
    ++ [
      # mizchi
      "empirical-prompt-tuning"
      "gh-fix-ci"
      "playwright-cli"
      "playwright-test"
      "tech-article-reproducibility"
    ]
    ++ [
      "opensrc"
    ]
    ++ [
      # vercel
      "composition-patterns"
      "react-best-practices"
      "web-design-guidelines"
    ];
    targets = {
      claude = {
        dest = ".claude/skills";
        structure = "copy-tree";
      };
    };
  };
}
