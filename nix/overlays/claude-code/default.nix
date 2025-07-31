final: prev: {
  claude-code = prev.claude-code.overrideAttrs (oldAttrs: {
    version = "1.0.55";
    src = prev.fetchzip {
      url = "https://registry.npmjs.org/@anthropic-ai/claude-code/-/claude-code-${oldAttrs.version}.tgz";
      hash = "sha256-xx7Nksfa0IN18i6MoU60olnY/BioS+W+OQmyETQYDHI=";
    };

    npmDepsHash = "sha256-v7a3DQD2Syhr3ITX7yHyEtQMCnrXwaf7IXXtl7JS07Q=";
  });
}
