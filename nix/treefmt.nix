{
  projectRootFile = "flake.nix";
  programs = {
    nixfmt.enable = true;
    oxfmt = {
      enable = true;
      includes = [
        "*.cjs"
        "*.css"
        "*.cts"
        "*.gql"
        "*.graphql"
        "*.graphqls"
        "*.handlebars"
        "*.hbs"
        "*.html"
        "*.js"
        "*.json"
        "*.json5"
        "*.jsonc"
        "*.jsx"
        "*.less"
        "*.md"
        "*.mdx"
        "*.mjml"
        "*.mjs"
        "*.mts"
        "*.scss"
        "*.svelte"
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
