#!/bin/zsh

#
# Install gitio
#

# Ensures the script is run with zsh.
if [[ "$(basename -- "$SHELL")" != "zsh" ]]; then
  echo "Please switch to zsh shell to continue."
  exit 1
fi

# Define the .zshrc PATH.
ZSHRC="${ZDOTDIR:-$HOME}/.zshrc"

# Update .zshrc with gitio.
if [[ -f "$ZSHRC" ]]; then
  echo "\nStarting the installation process of gitio..."

  # Ask the user if they want to create a backup.
  read -q "REPLY?Found an existing .zshrc in ${ZSHRC}. Do you want to create a backup? [y/N] "
  echo ""
  if [[ "$REPLY" =~ ^[Yy]$ ]]; then
    # Backup existing file
    ZSHRC_BACKUP="${ZSHRC}_$(date "+%Y%m%d%H%M%S").bak"
    echo "Creating backup of .zshrc as ${ZSHRC_BACKUP}..."

    if cp "${ZSHRC}" "${ZSHRC_BACKUP}"; then
      echo "gitio: Backup successful."
    else
      echo "\ngitio: Failed to backup .zshrc. Aborting operation." >&2
      exit 1
    fi
  else
    # If the response is not 'yes', proceed without creating a backup.
    echo "\ngitio: Proceeding without creating a backup."
  fi

  # Updates .zshrc with Gitio configurations.
  echo "gitio: Updating .zshrc..."
  GITIO_PATH_LINE="fpath=($HOME/gitio/script $fpath)"
  AUTOLOAD_LINE="autoload -Uz gitio"
  if ! grep -Fxq "${GITIO_PATH_LINE}" "${ZSHRC}" && ! grep -Fxq "${AUTOLOAD_LINE}" "${ZSHRC}"; then
    echo "" >> "${ZSHRC}"
    echo "# gitio PATH." >> "${ZSHRC}"
    echo "${GITIO_PATH_LINE}" >> "${ZSHRC}"
    echo "${AUTOLOAD_LINE}" >> "${ZSHRC}"
    echo "gitio: Appended PATH to ${ZSHRC}"
  else
    echo "gitio: PATH is already present in ${ZSHRC}"
  fi
else
  # Creates a new .zshrc file if it doesn't exist.
  echo "gitio: .zshrc not found. Creating a new one..."
  if ! touch "${ZSHRC}"; then
    echo "gitio: Failed to create a new .zshrc." >&2
    exit 1
  fi
  echo "gitio: Adding PATH to a new .zshrc..."
  echo "" >> "${ZSHRC}"
  echo "# gitio PATH." >> "${ZSHRC}"
  echo "${GITIO_PATH_LINE}" >> "${ZSHRC}"
  echo "${AUTOLOAD_LINE}" >> "${ZSHRC}"
  echo "gitio: PATH was added to a new .zshrc."
fi

# Attempts to reload .zshrc to apply changes.
if ! source "${ZSHRC}" &>/dev/null; then
  echo "gitio: Failed to reload .zshrc. Please reload manually to apply changes." >&2
fi

# Prints a success message.
echo "\ngitio: Install complete."
