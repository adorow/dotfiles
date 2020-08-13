#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Miscellaneous Tools\n\n"

brew_install "ShellCheck" "shellcheck"

if [ -d "$HOME/.nvm" ]; then
    brew_install "Yarn" "yarn"
fi

brew_install "asdf" "asdf"

brew_install "bat" "bat"

brew_install "exa" "exa"

brew_install "fd" "fd"

brew_install "fzf" "fzf"
execute "/usr/local/opt/fzf/install" "fzf command line tools"

brew_install "httpie" "httpie"

brew_install "ripgrep" "ripgrep"

brew_install "tree" "tree"

brew_install "wget" "wget"
