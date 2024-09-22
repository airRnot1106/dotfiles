<div align="center">
<samp>

# dotfiles

</samp>
</div>

## Getting Started

### Prerequisites

- git

### Installation

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin init --apply --branch nix git@github.com:airRnot1106/dotfiles.git
```

```bash
$HOME/.local/bin/chezmoi cd
```

```bash
source ./set_env_variables.sh
```

```bash
nix run
```

## LICENSE

MIT
