#!/usr/bin/env bash

set -xue -o pipefail

export IJ_SUFFIX=20250722-1400
export GW_CLONE_DIR=/scratch3/NCEPDEV/stmp/Benjamin.Koziol/inline-jedi-ufs/experiment/global-workflow.${IJ_SUFFIX}
export IJ_UFS_TAG=9193010aa52f17a7b3618fd75b4e3c03a79c3c59
export SLURM_ACCOUNT=epic

cd ..

source ./util/env.sh

source ./ij-clone.sh 2>&1 | tee out.ij-clone."${IJ_SUFFIX}"
source ./ij-build.sh 2>&1 | tee out.ij-build."${IJ_SUFFIX}"
source ./ij-test.sh 2>&1 | tee out.ij-test."${IJ_SUFFIX}"
