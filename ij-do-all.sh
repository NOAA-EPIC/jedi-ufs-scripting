#!/bin/bash

set -xue

if [[ ! -v SLURM_ACCOUNT ]]; then
  echo "ERROR: Please set SLURM_ACCOUNT, the account to use for running tests."
  exit 1
fi

source ./util/ij-env.sh

bash ./ij-clone.sh 2>&1 | tee out.clone-jedi-ufs."${JU_SUFFIX}"
bash ./ij-build.sh 2>&1 | tee out.build-jedi-ufs."${JU_SUFFIX}"
bash ./ij-test.sh 2>&1 | tee out.test-jedi-ufs."${JU_SUFFIX}"
