{ inputs, ... }:
let
  inherit (inputs)
    anthropic-skills
    find-skills
    mizchi
    opensrc
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
      vercel = {
        path = vercel-skills;
        subdir = "skills";
      };
    };
  };
}
