let
  javascript = {
    "[javascript]" = {
      "editor.defaultFormatter" = "biomejs.biome";
    };
    "[javascriptreact]" = {
      "editor.defaultFormatter" = "biomejs.biome";
    };
  };
  typescript = {
    "[typescript]" = {
      "editor.defaultFormatter" = "biomejs.biome";
    };
    "[typescriptreact]" = {
      "editor.defaultFormatter" = "biomejs.biome";
    };
    "typescript.inlayHints.enumMemberValues.enabled" = true;
    "typescript.inlayHints.functionLikeReturnTypes.enabled" = false;
    "typescript.inlayHints.parameterNames.enabled" = "none";
    "typescript.inlayHints.parameterNames.suppressWhenArgumentMatchesName" = true;
    "typescript.inlayHints.parameterTypes.enabled" = true;
    "typescript.inlayHints.propertyDeclarationTypes.enabled" = false;
    "typescript.inlayHints.variableTypes.enabled" = false;
    "typescript.preferences.importModuleSpecifier" = "non-relative";
    "typescript.updateImportsOnFileMove.enabled" = "always";
  };
  json = {
    "[json]" = {
      "editor.defaultFormatter" = "biomejs.biome";
    };
    "[jsonc]" = {
      "editor.defaultFormatter" = "biomejs.biome";
    };
  };
  prisma = {
    "[prisma]" = {
      "editor.defaultFormatter" = "Prisma.prisma";
    };
  };
  markdown = {
    "markdown-pdf.displayHeaderFooter" = false;
    "markdown.preview.breaks" = true;
    "markdown.preview.fontSize" = 22;
    "markdown.preview.lineHeight" = 1.1;
  };
  python = {
    "[python]" = {
      "editor.defaultFormatter" = "ms-python.black-formatter";
    };
  };
  cpp = {
    "[cpp]" = {
      "editor.defaultFormatter" = "ms-vscode.cpptools";
    };
  };
  rust = {
    "[rust]" = {
      "editor.defaultFormatter" = "rust-lang.rust-analyzer";
    };
  };
  lua = {
    "[lua]" = {
      "editor.defaultFormatter" = "JohnnyMorganz.stylua";
    };
  };
  dockerfile = {
    "[dockerfile]" = {
      "editor.defaultFormatter" = "ms-azuretools.vscode-docker";
    };
  };
  nix = {
    "[nix]" = {
      "editor.defaultFormatter" = "brettm12345.nixfmt-vscode";
    };
  };
in
{
  programs.vscode.profiles.default.userSettings =
    javascript
    // typescript
    // json
    // prisma
    // markdown
    // python
    // cpp
    // rust
    // lua
    // dockerfile
    // nix;
}
