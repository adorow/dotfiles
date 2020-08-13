My (macOS) dotfiles
===================

The base dotfiles for setting up a new environment. 
For more specific local needs there are the `*.local` files.

Table of Contents
-----------------

* [🔧 Setup](#setup)
* [🧑‍💻 References](#references)
* [↕️  Update](#update)

Setup
-----

To set up the `dotfiles` run the appropriate snippet in the terminal:

(⚠️  **DO NOT** run the `setup` snippet if you do not fully understand
[what it does][setup]. Seriously, **DON'T**!)

`bash -c "$(curl -LsS https://raw.github.com/adorow/dotfiles/main/src/os/setup.sh)"`

That's it! ✨

The setup process will:

* Download the dotfiles on your computer (by default it will suggest `~/projects/dotfiles`).
* Create some additional [directories][dirs].
* [Symlink][symlink] the [`git`][git], [`shell`][shell], and [`vim`][vim] files.
* Install applications / command-line tools for `macOS`.
* Set custom `macOS` preferences.
* Install some extensions.
* Define some aliases for shortcuts and overwrite some default command line tooling.

References
----------

A lot of what you find here was initially copied from [this repository][alrra-dotfiles].
With more inspiration coming from [this][kevinsuttle-macosdefaults], [this][jonathangin52-dotfiles] and [this][awesome-dotfiles] repositories.

Update
------

To update the dotfiles you can either run the [`setup` script][setup]
or, if you want to update one particular part, run the appropriate
[`os` script](src/os).

<!-- Link labels: -->
[alrra-dotfiles]: https://github.com/alrra/dotfiles
[awesome-dotfiles]: https://github.com/webpro/awesome-dotfiles
[dirs]: src/os/create_directories.sh
[git]: src/git
[jonathangin52-dotfiles]: https://github.com/JonathanGin52/dotfiles
[kevinsuttle-macosdefaults]: https://github.com/kevinSuttle/macOS-Defaults
[setup]: src/os/setup.sh
[shell]: src/shell
[symlink]: src/os/create_symbolic_links.sh
[vim]: src/vim
