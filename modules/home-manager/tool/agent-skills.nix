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
      # opensrc
      "opensrc"
    ]
    ++ [
      # vercel
      "composition-patterns"
      "react-best-practices"
      "web-design-guidelines"
    ];
    skills.explicit =
      # mattpocock
      {
        grill-me = {
          from = "mattpocock";
          path = "productivity/grill-me";
        };
        grilling = {
          from = "mattpocock";
          path = "productivity/grilling";
        };
        handoff = {
          from = "mattpocock";
          path = "productivity/handoff";
        };
      }
      //
      # mizchi
      {
        empirical-prompt-tuning = {
          from = "mizchi";
          path = "meta/empirical-prompt-tuning";
        };
        gh-fix-ci = {
          from = "mizchi";
          path = "devops/gh-fix-ci";
        };
        playwright-cli = {
          from = "mizchi";
          path = "testing/playwright-cli";
        };
        playwright-test = {
          from = "mizchi";
          path = "testing/playwright-test";
        };
        tech-article-reproducibility = {
          from = "mizchi";
          path = "meta/tech-article-reproducibility";
        };
      };
    targets = {
      claude = {
        dest = ".claude/skills";
        structure = "copy-tree";
      };
    };
  };
}
