{
  projectRootFile = "flake.nix";
  programs = {
    nixfmt.enable = true;
    oxfmt = {
      enable = true;
      includes = [
        "*.cjs"
        "*.css"
        "*.graphql"
        "*.hbs"
        "*.html"
        "*.js"
        "*.jsx"
        "*.json"
        "*.json5"
        "*.jsonc"
        "*.jsx"
        "*.md"
        "*.mdx"
        "*.mjs"
        "*.mustache"
        "*.scss"
        "*.toml"
        "*.ts"
        "*.tsx"
        "*.vue"
        "*.yaml"
        "*.yml"
      ];
    };
  };
}
