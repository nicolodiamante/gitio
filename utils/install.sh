#!/bin/sh

#
# Install gitio
#

# Determines the current user's shell, if not `zsh` then exit.
if [[ "$(basename -- "$SHELL")" != "zsh" ]]; then
  echo "Please switch to zsh shell to continue."
  exit 1
fi

# Defines the PATHs.
SCRIPT="${HOME}/gitio/script"
ZSHRC="${ZDOTDIR:-${XDG_CONFIG_HOME/zsh:-$HOME}}/.zshrc"

if [[ -d "$SCRIPT" && -f "$ZSHRC" ]]; then
# Append the necessary lines to zshrc.
cat << EOF >> ${ZSHRC}
# gitio
fpath=(~/gitio/script \$fpath)
autoload -Uz gitio
EOF
  echo 'zsh: appended gitio to zshrc.'

  # Reloads shell.
  source "${ZSHRC}"
else
  echo 'zsh: zshrc not found!'
fi
