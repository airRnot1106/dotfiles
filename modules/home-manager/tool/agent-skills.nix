{ inputs, ... }:
{
  imports = [
    inputs.agent-skills.homeManagerModules.default
  ];
  programs.agent-skills = {
    enable = true;
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
