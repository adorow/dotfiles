#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

./xcode.sh
./homebrew.sh
./git.sh

./zsh.sh

./../nvm.sh
./atom.sh
./browsers.sh
./compression_tools.sh
./deno.sh
./gpg.sh
./image_tools.sh
./intellij.sh
./misc.sh
./misc_tools.sh
./ngrok.sh
./../npm.sh
./postman.sh
./programming_languages.sh
./quick_look.sh
./tmux.sh
./video_tools.sh
./../vim.sh
./vscode.sh
./web_font_tools.sh

