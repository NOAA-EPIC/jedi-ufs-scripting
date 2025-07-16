#!/usr/bin/env bash

set -xue -o pipefail

if [[ ! -v SLURM_ACCOUNT ]]; then
  echo "ERROR: Please set SLURM_ACCOUNT, the account to use for running tests."
  exit 1
fi

source ../util/env.sh

source ./ij-clone.sh 2>&1 | tee out.ij-clone."${IJ_SUFFIX}"
source ./ij-build.sh 2>&1 | tee out.ij-build."${IJ_SUFFIX}"
source ./ij-test.sh 2>&1 | tee out.ij-test."${IJ_SUFFIX}"
