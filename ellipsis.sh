#!/usr/bin/env bash

pkg.link() {
  case $(os.platform) in
    osx)
      fs.link_file "emacs.d" "$HOME/.emacs.d"
      fs.link_file "platforms/osx/spacemacs" "$HOME/.spacemacs"
      ;;
  esac
}

pkg.install() {
  git submodule init
  git submodule update

  case $(os.platform) in
    osx)
      installBrewPackages
  esac
}

pkg.pull() {
  git.pull
}

pkg.unlink() {
  rm "$HOME/.emacs.d"

  hooks.unlink
}

installBrewPackages() {
  brew tap d12frosted/emacs-plus
  brew update
  brew install emacs-plus
  brew linkapps emacs-plus
}
