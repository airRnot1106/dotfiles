{
  inputs,
  pkgs,
  lib,
  ...
}:
let
  inherit (inputs) agent-skills;
  inherit (pkgs) fetchFromGitHub;

  airrnot = fetchFromGitHub {
    owner = "airRnot1106";
    repo = "skills";
    rev = "77705db597e6f7d841f9d2d9755c05b103ba04af";
    sha256 = "sha256-UHMbxQjAdkGpWOenKYbSurK1F71AueUjH50wsU/Q4Lo=";
  };
  anthropic-skills = fetchFromGitHub {
    owner = "anthropics";
    repo = "skills";
    rev = "1ed29a03dc852d30fa6ef2ca53a67dc2c2c2c563";
    sha256 = "sha256-9FGubcwHcGBJcKl02aJ+YsTMiwDOdgU/FHALjARG51c=";
  };
  find-skills = fetchFromGitHub {
    owner = "vercel-labs";
    repo = "skills";
    rev = "88b9564832a2cdb607a3dc6d8797a11a61b15a08";
    sha256 = "sha256-BMO+wEyZyVylqkMwsWhED1k69Drci2o7gCESZTEGwAI=";
  };
  mizchi = fetchFromGitHub {
    owner = "mizchi";
    repo = "chezmoi-dotfiles";
    rev = "c7845a843b54f349113435e8f5f48705ce59acf2";
    sha256 = "sha256-XCk4UKUtSNRUips5XrCxNhvHo+FDKAwVhi99Tcm9Caw=";
  };
  react-doctor = fetchFromGitHub {
    owner = "millionco";
    repo = "react-doctor";
    rev = "a39c6f25d73eaf6a44ddb714b03e5d66baeadbdf";
    sha256 = "sha256-AhX1BCEWD1y+pCwQqFexnkwBQdrKJkmDx0j9Am7uDsQ=";
  };
  vercel = fetchFromGitHub {
    owner = "vercel-labs";
    repo = "agent-skills";
    rev = "e23951b8cad2f4b1e7e176c5731127c1263fe86f";
    sha256 = "sha256-rSfySiCwtEP82tG9La4G7l4bu7W40ICT2qHeqpJArXc=";
  };
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
      airrnot = {
        path = airrnot;
        subdir = "skills";
      };
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
        subdir = "dot_claude/skills";
      };
      react-doctor = {
        path = react-doctor;
        subdir = "skills";
      };
      vercel = {
        path = vercel;
        subdir = "skills";
      };
    };
    skills.enable = [
      # airrnot
      "frontend-structure"
      "next-bundle-analyzer"
    ]
    ++ [
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
      # react-doctor
      "react-doctor"
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
