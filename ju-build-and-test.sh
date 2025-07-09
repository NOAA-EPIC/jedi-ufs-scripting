#!/bin/bash

set -xue

if [[ ! -v SLURM_ACCOUNT ]]; then
  echo "ERROR: Please set SLURM_ACCOUNT, the account to use for running tests."
  exit 1
fi

bash ./ju-build.sh 2>&1 | tee out.build-jedi-ufs
bash ./ju-test.sh 2>&1 | tee out.test-jedi-ufs
