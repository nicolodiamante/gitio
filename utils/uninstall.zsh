#!/bin/zsh

#
# Uninstall gitio.
#

echo "\nStarting the uninstallation process of gitio..."

# Define the .zshrc PATH.
ZSHRC="${ZDOTDIR:-$HOME}/.zshrc"
ZSHRC_BACKUP_GLOB="${ZSHRC}_*.bak"

# Function to remove gitio configurations.
remove_gitio_config() {
  echo "\nChecking for gitio configuration in .zshrc..."

  GITIO_PATH_LINE="fpath=($HOME/gitio/script $fpath)"
  AUTOLOAD_LINE="autoload -Uz gitio"

  if grep -Fxq "${GITIO_PATH_LINE}" "${ZSHRC}" || grep -Fxq "${AUTOLOAD_LINE}" "${ZSHRC}"; then
    read -q "REPLY?gitio configurations found in .zshrc. Do you want to remove them? [y/N] "
    echo ""
    if [[ "$REPLY" =~ ^[Yy]$ ]]; then
      if [[ "$OSTYPE" == "darwin"* ]]; then
        sed -i '' '/# gitio PATH./d' "${ZSHRC}"
        sed -i '' "/fpath=($HOME\/gitio\/script $fpath)/d" "${ZSHRC}"
        sed -i '' '/autoload -Uz gitio/d' "${ZSHRC}"
      else
        sed -i '/# gitio PATH./d' "${ZSHRC}"
        sed -i "/fpath=($HOME\/gitio\/script $fpath)/d" "${ZSHRC}"
        sed -i '/autoload -Uz gitio/d' "${ZSHRC}"
      fi
      echo "gitio: Configurations have been removed from .zshrc."
    else
      echo "gitio: No changes made to .zshrc."
    fi
  else
    echo "gitio: No configurations found in .zshrc."
  fi
}

# Check for .zshrc and back it up before making changes.
if [[ -f "$ZSHRC" ]]; then
  # Look for the most recent backup.
  backups=($(ls -t $ZSHRC_BACKUP_GLOB 2>/dev/null))
  if [[ ${#backups[@]} -gt 0 ]]; then
    latest_backup="${backups[0]}"
    echo "gitio: Latest backup found at ${latest_backup}."
    read -q "REPLY?Do you want to restore from the latest backup? [y/N] "
    echo ""
    if [[ "$REPLY" =~ ^[Yy]$ ]]; then
      # Restore the latest backup.
      if cp "${latest_backup}" "${ZSHRC}"; then
        echo "gitio: Restored .zshrc from the latest backup."
        exit 0
      else
        echo "gitio: Failed to restore .zshrc from the latest backup." >&2
        exit 1
      fi
    else
      remove_gitio_config
    fi
  else
    remove_gitio_config
  fi
else
  echo "\ngitio: .zshrc not found. No cleanup needed."
fi

echo "\ngitio: Uninstall complete."
