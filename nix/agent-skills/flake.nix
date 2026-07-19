{
  inputs = {
    agenput-skills.url = "github:airRnot1106/agenput-skills-nix";
    flake-utils.url = "github:numtide/flake-utils";

    inspired-mino-design-skills = {
      url = "github:my-take-dev/inspired-mino-design-skills";
      flake = false;
    };
    anthropic-skills = {
      url = "github:anthropics/skills";
      flake = false;
    };
    cognitive-rhythm-writing = {
      url = "git+https://gist.github.com/k16shikano/eb2929f13ed19c97188393d297be8432.git";
      flake = false;
    };
    find-skills = {
      url = "github:vercel-labs/skills";
      flake = false;
    };
    japanese-tech-writing = {
      url = "git+https://gist.github.com/k16shikano/fd287c3133457c4fd8f5601d34aa817d.git";
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
  };

  outputs =
    {
      self,
      agenput-skills,
      flake-utils,
      nixpkgs,
      ...
    }@inputs:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};

        skills = [
          {
            name = "cognitive-rhythm-writing";
            src = inputs.cognitive-rhythm-writing;
          }
          {
            name = "empirical-prompt-tuning";
            src = inputs.mizchi;
            subpath = "meta/empirical-prompt-tuning";
          }
          {
            name = "find-skills";
            src = inputs.find-skills;
            subpath = "skills/find-skills";
          }
          {
            name = "gh-fix-ci";
            src = inputs.mizchi;
            subpath = "devops/gh-fix-ci";
          }
          {
            name = "grill-me";
            src = inputs.mattpocock;
            subpath = "skills/productivity/grill-me";
          }
          {
            name = "grill-with-docs";
            src = inputs.mattpocock;
            subpath = "skills/engineering/grill-with-docs";
          }
          {
            name = "grilling";
            src = inputs.mattpocock;
            subpath = "skills/productivity/grilling";
          }
          {
            name = "handoff";
            src = inputs.mattpocock;
            subpath = "skills/productivity/handoff";
          }
          {
            name = "japanese-tech-writing";
            src = inputs.japanese-tech-writing;
          }
          {
            name = "mino-architecture-quality-strategy";
            src = inputs.inspired-mino-design-skills;
            subpath = ".agents/skills/mino-architecture-quality-strategy";
          }
          {
            name = "mino-core";
            src = inputs.inspired-mino-design-skills;
            subpath = ".agents/skills/mino-core";
          }
          {
            name = "mino-design-by-contract";
            src = inputs.inspired-mino-design-skills;
            subpath = ".agents/skills/mino-design-by-contract";
          }
          {
            name = "mino-domain-model-completeness";
            src = inputs.inspired-mino-design-skills;
            subpath = ".agents/skills/mino-domain-model-completeness";
          }
          {
            name = "mino-interface-implementation-separation";
            src = inputs.inspired-mino-design-skills;
            subpath = ".agents/skills/mino-interface-implementation-separation";
          }
          {
            name = "mino-problem-framing";
            src = inputs.inspired-mino-design-skills;
            subpath = ".agents/skills/mino-problem-framing";
          }
          {
            name = "mino-reproducible-development";
            src = inputs.inspired-mino-design-skills;
            subpath = ".agents/skills/mino-reproducible-development";
          }
          {
            name = "opensrc";
            src = inputs.opensrc;
            subpath = "skills/opensrc";
          }
          {
            name = "skill-creator";
            src = inputs.anthropic-skills;
            subpath = "skills/skill-creator";
          }
        ];
      in
      {
        nput = {
          skills-claude = agenput-skills.lib.mkSkillsManifest {
            inherit pkgs skills;
            root = agenput-skills.lib.homeRoot;
            prefix = agenput-skills.lib.presets.claude.global;
          };
        };

        devShells.default = pkgs.mkShellNoCC {
          inputsFrom = [
            (agenput-skills.lib.mkSkillsDevShell {
              inherit pkgs;
              names = builtins.attrNames self.nput.${system};
            })
          ];
        };
      }
    );
}
