#!/bin/bash -e
THIS_DIR=$(cd "$(dirname "$0")"; pwd)

"${THIS_DIR}/init-kubectl-fzf.sh" stop
