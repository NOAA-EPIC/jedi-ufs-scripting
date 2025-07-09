#!/usr/bin/env bash

set -xue

if [[ ! -v SLURM_ACCOUNT ]]; then
  echo "ERROR: Please set SLURM_ACCOUNT, the account to use for running tests."
  exit 1
fi

source ./util/ij-env.sh

source ./ij-clone.sh 2>&1 | tee out.ij-clone."${JU_SUFFIX}" || exit 1
source ./ij-build.sh 2>&1 | tee out.ij-build."${JU_SUFFIX}"
source ./ij-test.sh 2>&1 | tee out.ij-test."${JU_SUFFIX}"
