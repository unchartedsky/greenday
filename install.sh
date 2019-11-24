#!/bin/bash -e

install_direnv() {
  if ! (type direnv &>/dev/null); then
    brew install direnv
  fi

  if ! (grep 'direnv hook' ~/.bash_profile > /dev/null); then
    cat conf.d/.bash_profile >> ~/.bash_profile
    echo 'Run once `source ~/.bash_profile`'
  fi

  if ! (grep 'direnv hook' ~/.zshrc > /dev/null); then
    cat conf.d/.zshrc >> ~/.zshrc
    echo 'Run once `source ~/.zshrc`'
  fi

  if ! (grep 'export_alias' ~/.direnvrc > /dev/null); then
    cat conf.d/.direnvrc >> ~/.direnvrc
  fi
}

install_brew() {
  type brew &>/dev/null || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  brew bundle
}

sudo -v

install_brew

install_direnv
