#!/bin/sh

#
# Install gitio
#

# Determines the current user's shell, if `zsh` then installs.
[[ "$(basename -- "$SHELL")" == "zsh" ]] || exit 1

# Defines the PATHs.
SCRIPT="${HOME}/gitio/script"
ZSHRC="${ZDOTDIR:-${XDG_CONFIG_HOME/zsh:-$HOME}}/.zshrc"

if [[ -d "$SCRIPT" && -f "$ZSHRC" ]]; then
  # Append to `zshrc`.
  cat << EOF >> ${ZSHRC}
# gitio
fpath=(~/gitio/script \$fpath)
autoload -Uz gitio
EOF
  echo 'zsh: appended gitio to zshrc.'

  # Reload shell.
  source "${ZSHRC}"
else
  echo 'zsh: zshrc not found!'
fi
