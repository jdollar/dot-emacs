#!/usr/bin/env bash

pkg.link() {
  case $(os.platform) in
    osx)
      fs.link_file "emacs.d" "$HOME/.emacs.d"
      ;;
  esac
}

pkg.install() {
  git submodule init
  git submodule update
}

pkg.pull() {
  git.pull
}

pkg.unlink() {
  rm "$HOME/.emacs.d"

  hooks.unlink
}
