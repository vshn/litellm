#!/bin/sh

set -ea

# use with caution, the helm diff command with --reuse-values seems not so deterministic.

SCRIPT_DIR=$(realpath "$(dirname "$0")")
cd $SCRIPT_DIR

namespace=${NAMESPACE:-vshn-lightllm-dev}
instance=${INSTANCE:-dev}
action=${1:-diff}

helm dep build

if [ "$action" = "deploy" ]; then
  helm --kube-as-user "system:admin" upgrade --install $instance --namespace=$namespace --create-namespace --reuse-values $SCRIPT_DIR
  exit 0
fi

if [ "$action" = "diff" ]; then
  HELM_DIFF_USE_UPGRADE_DRY_RUN=true helm --kube-as-user "system:admin" diff upgrade --namespace=$namespace --reuse-values --allow-unreleased $instance $SCRIPT_DIR
  exit 0
fi
