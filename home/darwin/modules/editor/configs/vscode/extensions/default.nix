{ pkgs, ... }:
{
  programs.vscode = {
    mutableExtensionsDir = true;
    extensions = (
      with pkgs.vscode-extensions;
      [
        alexisvt.flutter-snippets
        apollographql.vscode-apollo
        asvetliakov.vscode-neovim
        bbenoist.nix
        bierner.github-markdown-preview
        bierner.markdown-checkbox
        bierner.markdown-emoji
        bierner.markdown-footnotes
        bierner.markdown-mermaid
        bierner.markdown-preview-github-styles
        bierner.markdown-yaml-preamble
        biomejs.biome
        bourhaouta.tailwindshades
        bradlc.vscode-tailwindcss
        brettm12345.nixfmt-vscode
        charliermarsh.ruff
        christian-kohler.path-intellisense
        ckolkman.vscode-postgres
        codezombiech.gitignore
        cschlosser.doxdocgen
        csstools.postcss
        dart-code.dart-code
        dart-code.flutter
        davidanson.vscode-markdownlint
        davidlgoldberg.jumpy2
        dbaeumer.vscode-eslint
        denoland.vscode-deno
        digitalbrainstem.javascript-ejs-support
        donjayamanne.githistory
        dsznajder.es7-react-js-snippets
        eamodio.gitlens
        ecmel.vscode-html-css
        editorconfig.editorconfig
        esbenp.prettier-vscode
        eservice-online.vs-sharper
        felipecaputo.git-project-manager
        formulahendry.auto-close-tag
        formulahendry.auto-rename-tag
        formulahendry.code-runner
        github.copilot
        github.copilot-chat
        golang.go
        htmlhint.vscode-htmlhint
        icrawl.discord-vscode
        ipatalas.vscode-postfix-ts
        james-yu.latex-workshop
        jebbs.plantuml
        jeff-hykin.better-cpp-syntax
        jnoortheen.nix-ide
        johnnymorganz.stylua
        kevinrose.vsc-python-indent
        kimuson.ts-type-expand
        mechatroner.rainbow-csv
        mhutchie.git-graph
        mrmlnc.vscode-scss
        ms-azuretools.vscode-docker
        ms-ceintl.vscode-language-pack-ja
        ms-dotnettools.csharp
        ms-dotnettools.vscode-dotnet-runtime
        ms-python.black-formatter
        ms-python.debugpy
        ms-python.python
        ms-python.vscode-pylance
        ms-toolsai.jupyter
        ms-toolsai.jupyter-keymap
        ms-toolsai.jupyter-renderers
        ms-toolsai.vscode-jupyter-cell-tags
        ms-toolsai.vscode-jupyter-slideshow
        ms-vscode-remote.remote-containers
        ms-vscode-remote.remote-ssh
        ms-vscode-remote.remote-ssh-edit
        ms-vscode.cpptools
        ms-vscode.cpptools-extension-pack
        ms-vscode.cpptools-themes
        ms-vscode.remote-explorer
        mtxr.sqltools
        mtxr.sqltools-driver-mysql
        nash.awesome-flutter-snippets
        nhoizey.gremlins
        nmrmsys.vscode-sql-formatter-mod
        oderwat.indent-rainbow
        orta.vscode-jest
        oven.bun-vscode
        pdconsec.vscode-print
        plibither8.remove-comments
        prisma.prisma
        rangav.vscode-thunder-client
        redhat.java
        reditorsupport.r
        ritwickdey.liveserver
        rogalmic.vscode-xml-complete
        rust-lang.rust-analyzer
        rwietter.illusion
        saikou9901.evilinspector
        shardulm94.trailing-spaces
        streetsidesoftware.code-spell-checker
        stylelint.vscode-stylelint
        sumneko.lua
        taodongwu.ejs-snippets
        vadimcn.vscode-lldb
        visualstudioexptteam.intellicode-api-usage-examples
        visualstudioexptteam.vscodeintellicode
        vitest.explorer
        vscjava.vscode-gradle
        vscjava.vscode-java-debug
        vscjava.vscode-java-dependency
        vscjava.vscode-java-pack
        vscjava.vscode-java-test
        vscjava.vscode-maven
        vscode-icons-team.vscode-icons
        vscodevim.vim
        vue.volar
        vunguyentuan.vscode-postcss
        wmaurer.change-case
        wraith13.bracket-lens
        xabikos.javascriptsnippets
        yoavbls.pretty-ts-errors
        yukai.map-replace-js
        yusukehirao.vscode-markuplint
        yzane.markdown-pdf
        yzhang.markdown-all-in-one
        zarifprogrammer.tailwind-snippets
        zhihaocui.ts-interface-sorter
        zignd.html-css-class-completion
      ]
    );
  };
}
