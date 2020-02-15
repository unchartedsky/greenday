#!/bin/bash -ex
RED='\033[0;31m'
NC='\033[0m' # No Color

if ! (which cache_builder > /dev/null); then
    echo -e "${RED}'cache_builder' is not found!${NC}"
    return 1
fi

if [[ "${CLUSTER_CODENAME}" == "" ]]; then
    echo -e "${RED}'CLUSTER_CODENAME' is required!${NC}"
    return 2
fi

CMD=$1

if [[ "${CMD}" == "" ]]; then
    CMD=start
fi

KUBECONFIG_FZF_DAEMON_WORKDIR="/tmp/kubectl_fzf/${CLUSTER_CODENAME}"
KUBECONFIG_FZF_DAEMON_NAME="kubectl_fzf"
KUBECONFIG_FZF_DAEMON_LOG_FILE="${KUBECONFIG_FZF_DAEMON_WORKDIR}/${KUBECONFIG_FZF_DAEMON_NAME}.log"
KUBECONFIG_FZF_DAEMON_PID_FILE="${KUBECONFIG_FZF_DAEMON_WORKDIR}/${KUBECONFIG_FZF_DAEMON_NAME}.pid"
# export KUBECTL_FZF_CACHE="${KUBECONFIG_FZF_DAEMON_WORKDIR}/cache"

mkdir -p "${KUBECONFIG_FZF_DAEMON_WORKDIR}"
# mkdir -p "${KUBECTL_FZF_CACHE}"

cache_builder --daemon="${CMD}" --daemon-name="${KUBECONFIG_FZF_DAEMON_NAME}" --daemon-log-file="${KUBECONFIG_FZF_DAEMON_LOG_FILE}" --daemon-pid-file="${KUBECONFIG_FZF_DAEMON_PID_FILE}"
