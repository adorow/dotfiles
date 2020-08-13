#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   IntelliJ\n\n"

brew_install "IntelliJ Idea CE" "intellij-idea-ce" "homebrew/cask" "cask"
