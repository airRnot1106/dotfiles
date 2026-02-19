{
  inputs,
  pkgs,
  lib,
  ...
}:
let
  inherit (inputs) agent-skills;
  inherit (pkgs) fetchFromGitHub;

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
      anthropic = {
        path = anthropic-skills;
        subdir = "skills";
      };
      find-skills = {
        path = find-skills;
        subdir = "skills";
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
      "composition-patterns"
      "doc-coauthoring"
      "docx"
      "find-skills"
      "frontend-design"
      "internal-comms"
      "pdf"
      "pptx"
      "react-best-practices"
      "react-doctor"
      "skill-creator"
      "web-design-guidelines"
      "webapp-testing"
      "xlsx"
    ];
    targets = {
      claude = {
        dest = ".claude/skills";
        structure = "copy-tree";
      };
    };
  };
}
