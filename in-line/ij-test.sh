#!/usr/bin/env bash

set -xue -o pipefail

if [[ ! -v SLURM_ACCOUNT ]]; then
  echo "ERROR: Please set SLURM_ACCOUNT, the account to use for running tests."
  exit 1
fi

source ./util/env.sh
source ./util/load-modules.sh

cd "${_IJ_GDAS_DIR}"/build/fv3-jedi

ctest -R "ufs|fv3jedi_test_stateset_transpose"
