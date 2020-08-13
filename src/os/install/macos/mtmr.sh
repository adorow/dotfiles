#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

symlink_touchbar_items_file() {
    local sourceFile=""
    local targetFile=""

    sourceFile="$(cd ../../.. && pwd)/mtmr/items.json"
    targetFile="$HOME/Library/Application\ Support/MTMR/items.json"

    execute \
          "ln -fs $sourceFile $targetFile" \
          "$targetFile → $sourceFile"
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   MTMR\n\n"

brew_install "MTMR" "mtmr" "homebrew/cask" "cask"

symlink_touchbar_items_file


