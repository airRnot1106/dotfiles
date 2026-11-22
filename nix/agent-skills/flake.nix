{
  inputs = {
    agenput-skills.url = "github:airRnot1106/agenput-skills-nix";
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs";

    airrnot = {
      url = "github:airRnot1106/skills";
      flake = false;
    };
    anthropic-skills = {
      url = "github:anthropics/skills";
      flake = false;
    };
    find-skills = {
      url = "github:vercel-labs/skills";
      flake = false;
    };
    gh-stack = {
      url = "github:github/gh-stack";
      flake = false;
    };
    inspired-mino-design-skills = {
      url = "github:my-take-dev/inspired-mino-design-skills";
      flake = false;
    };
    mattpocock = {
      url = "github:mattpocock/skills";
      flake = false;
    };
    mizchi = {
      url = "github:mizchi/skills";
      flake = false;
    };
    opensrc = {
      url = "github:vercel-labs/opensrc";
      flake = false;
    };
    yomiyasu = {
      url = "github:nanaism/yomiyasu";
      flake = false;
    };
  };

  outputs =
    {
      agenput-skills,
      flake-utils,
      nixpkgs,
      ...
    }@inputs:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};

        skills = agenput-skills.lib.mkSkills {
          inherit pkgs;
          sets.skills-claude = {
            scope = "global";
            paths = with agenput-skills.lib.presets; [
              agents.global
              claude.global
            ];
            sources = [
              {
                src = inputs.airrnot;
                dir = "skills";
                skills = [
                  "code-prose-writing"
                  "japanese-tech-writing"
                ];
              }
              {
                src = inputs.mattpocock;
                dir = "skills";
                skills = [
                  "domain-modeling"
                  "grill-me"
                  "grill-with-docs"
                  "grilling"
                  "handoff"
                ];
              }
              {
                src = inputs.mizchi;
                skills = [
                  "empirical-prompt-tuning"
                  "gh-fix-ci"
                ];
              }
              {
                src = inputs.find-skills;
                dir = "skills";
                skills = [ "find-skills" ];
              }
              {
                src = inputs.gh-stack;
                dir = "skills";
                skills = [ "gh-stack" ];
              }
              {
                src = inputs.inspired-mino-design-skills;
                dir = ".agents/skills";
                skills = [
                  "mino-architecture-quality-strategy"
                  "mino-core"
                  "mino-design-by-contract"
                  "mino-domain-model-completeness"
                  "mino-interface-implementation-separation"
                  "mino-problem-framing"
                  "mino-reproducible-development"
                ];
              }
              {
                src = inputs.opensrc;
                dir = "skills";
                skills = [ "opensrc" ];
              }
              {
                src = inputs.anthropic-skills;
                dir = "skills";
                skills = [ "skill-creator" ];
              }
              {
                src = inputs.yomiyasu;
                dir = "skills";
                skills = [ "yomiyasu" ];
              }
            ];
          };
        };
      in
      {
        inherit (skills) layat;

        devShells.default = skills.devShell;
      }
    );
}
