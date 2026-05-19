{ inputs, ... }:
let
  inherit (inputs)
    anthropic-skills
    find-skills
    mizchi
    opensrc
    takt-builder-skill
    vercel-skills
    ;
in
{
  programs.agent-skills = {
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
      takt-builder = {
        path = takt-builder-skill;
      };
      vercel = {
        path = vercel-skills;
        subdir = "skills";
      };
    };
  };
}
