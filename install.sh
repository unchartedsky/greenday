#!/bin/bash
set -e

THIS_DIR=$(cd "$(dirname "$0")"; pwd)

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

OSTYPE=$(uname)
case "$OSTYPE" in
  Darwin)  export THIS_OS="darwin" ;;
  Linux) export THIS_OS="linux" ;;
  *) echo "Your Operating System '$THIS_OS' is not supported." && exit 1 ;;
esac

ARCHITECTURE=$(uname -m)
case "$ARCHITECTURE" in
  amd64)  export ARCH="amd64" ;;
  x86_64) export ARCH="amd64" ;;
  *) echo "Your Architecture '$ARCH' is not supported."  && exit 2 ;;
esac

getshell() {
  echo $(basename $SHELL)
}

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

install_bash_completion() {
  if [[ "$(getshell)" == "bash" ]]; then
    grep .bashrc ~/.bash_profile || echo "[ -f \"\${HOME}/.bashrc\" ] && source \"\${HOME}/.bashrc\"" >> ~/.bash_profile

    [ ! -f ~/.bashrc ] && touch ~/.bashrc

    grep 'profile.d/bash_completion.sh' ~/.bashrc || echo '[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"' >> ~/.bashrc
  fi
}

install_kubectl_fzf() {
  if [[ "${THIS_OS}" == "darwin" ]]; then
    BIN_DIR="${THIS_DIR}/bin/${THIS_OS}_${ARCH}"

    if [ ! -d "${BIN_DIR}" ]; then
      mkdir -p "${BIN_DIR}"
    fi
    pushd "${BIN_DIR}"
    # Mac
    FILE="kubectl-fzf_darwin_amd64.tar.gz"
    curl -sL https://github.com/bonnefoa/kubectl-fzf/releases/latest/download/$FILE | tar xz

    echo "complete -F __start_kubectl kube" >> kubectl_fzf.sh
    popd

    if [[ "$(getshell)" == "bash" ]]; then
      grep fzf.bash ~/.bashrc || echo "[ -f ~/.fzf.bash ] && source ~/.fzf.bash" >> ~/.bashrc
      grep 'bash_completion.d/kubectl' ~/.bashrc || echo "source \$(brew --prefix)/etc/bash_completion.d/kubectl" >> ~/.bashrc
      grep kubectl_fzf.sh ~/.bashrc || echo "[ -f \"${BIN_DIR}/kubectl_fzf.sh\" ] && source \"${BIN_DIR}/kubectl_fzf.sh\"" >> ~/.bashrc

    elif [[ "$(getshell)" == "zsh" ]]; then
      grep fzf.zsh ~/.zshrc || echo "[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh" >> ~/.zshrc
      grep 'kubectl completion zsh' ~/.zshrc || echo "source <(kubectl completion zsh)" >> ~/.zshrc
      grep 'compinit' ~/.zshrc || echo "autoload -Uz compinit && compinit"  >> ~/.zshrc
      grep kubectl_fzf.sh ~/.zshrc || echo "[ -f \"${BIN_DIR}/kubectl_fzf.plugin.zsh\" ] && source \"${BIN_DIR}/kubectl_fzf.plugin.zsh\"" >> ~/.zshrc
    fi

  fi
}

sudo -v

install_brew

install_direnv

install_bash_completion

install_kubectl_fzf
