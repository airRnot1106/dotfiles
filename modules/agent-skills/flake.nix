{
  inputs = {
    anthropic-skills = {
      url = "github:anthropics/skills";
      flake = false;
    };
    find-skills = {
      url = "github:vercel-labs/skills";
      flake = false;
    };
    mizchi = {
      url = "github:mizchi/skills";
      flake = false;
    };
    vercel-skills = {
      url = "github:vercel-labs/agent-skills";
      flake = false;
    };
  };

  outputs =
    {
      anthropic-skills,
      find-skills,
      mizchi,
      vercel-skills,
      ...
    }:
    {
      inherit
        anthropic-skills
        find-skills
        mizchi
        vercel-skills
        ;
    };
}
