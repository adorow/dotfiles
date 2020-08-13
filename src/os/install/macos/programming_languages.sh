#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

print_in_purple "\n   Programming Languages\n\n"

brew_install "Assembly 80x86" "nasm"
brew_install "Ballerina" "ballerina"
brew_install "Clojure" "clojure"
brew_install "Elixir" "elixir"
brew_install "Erlang" "erlang"
brew_install "Go" "golang"
brew_install "Haskell" "haskell-stack"
brew_install "Io" "io"
brew_install "Java" "java"
brew_install "Julia" "julia"
brew_install "Kotlin" "kotlin"
brew_install "Prolog (GNU)" "gnu-prolog"
brew_install "Python 3.8" "python@3.8"
brew_install "Racket (Scheme)" "racket"
brew_install "Ruby" "ruby"
brew_install "Rust" "rust"
brew_install "Scala" "scala"
brew_install "Swift" "swift"
brew_install "Typescript" "typescript"
