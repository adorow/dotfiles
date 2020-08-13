#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_oh_my_zsh() {

    if [ ! -e "$HOME/.oh-my-zsh/oh-my-zsh.sh" ]; then
        echo "oh-my-zsh.sh  is missing!"
        exit 1
        printf "\n" | sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh) --keep-zshrc --unattended" &> /dev/null
        #  └─ simulate the ENTER keypress
    fi

    print_result $? "Oh My Zsh"

}

install_oh_my_zsh_plugins() {

    declare -a OMZ_PLUGINS=(
      "zsh-syntax-highlighting"
      "zsh-autosuggestions"
    )

    local plugin=""
    local basePluginsFolder="~/.oh-my-zsh/custom/plugins"

    for plugin in "${OMZ_PLUGINS[@]}"; do

      local pluginFolder="$basePluginsFolder/$plugin"

      if [ ! -e "$pluginFolder" ]; then
          execute "git -C $basePluginsFolder clone https://github.com/zsh-users/$plugin" "$plugin (install)"
      fi

    done

}

change_default_shell() {

    declare -r LOCAL_SHELL_CONFIG_FILE="$HOME/.zsh.local"

    local configs=""
    local pathConfig=""

    local newShellPath=""
    local brewPrefix=""

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Try to get the path of the `Zsh`
    # version installed through `Homebrew`.

    brewPrefix="$(brew_prefix)" \
        || return 1

    pathConfig="PATH=\"$brewPrefix/bin:\$PATH\""
    configs="
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

$pathConfig

export PATH
"

    newShellPath="$brewPrefix/bin/zsh" \

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Add the path of the `Bash` version installed through `Homebrew`
    # to the list of login shells from the `/etc/shells` file.
    #
    # This needs to be done because applications use this file to
    # determine whether a shell is valid (e.g.: `chsh` consults the
    # `/etc/shells` to determine whether an unprivileged user may
    # change the login shell for her own account).
    #
    # http://www.linuxfromscratch.org/blfs/view/7.4/postlfs/etcshells.html

    if ! grep "$newShellPath" < /etc/shells &> /dev/null; then
        execute \
            "printf '%s\n' '$newShellPath' | sudo tee -a /etc/shells" \
            "Zsh (add '$newShellPath' in '/etc/shells')" \
        || return 1
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Set latest version of `Bash` as the default
    # (macOS uses by default an older version of `Bash`).

    chsh -s "$newShellPath" &> /dev/null
    print_result $? "Zsh (use latest version)"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # If needed, add the necessary configs in the
    # local shell configuration file.

    if ! grep "^$pathConfig" < "$LOCAL_SHELL_CONFIG_FILE" &> /dev/null; then
        execute \
            "printf '%s' '$configs' >> $LOCAL_SHELL_CONFIG_FILE \
                && . $LOCAL_SHELL_CONFIG_FILE" \
            "Zsh (update $LOCAL_SHELL_CONFIG_FILE)"
    fi

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Zsh\n\n"

#    brew_install "Zsh" "zsh" \
#      && change_default_shell

    install_oh_my_zsh
    exit 1
    install_oh_my_zsh_plugins

}

main
