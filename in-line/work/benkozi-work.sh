#!/usr/bin/env bash

set -xue -o pipefail

export IJ_SUFFIX=20250711-1056
export IJ_CLONE_DIR=/scratch3/NCEPDEV/stmp/Benjamin.Koziol/inline-jedi-ufs/experiment/global-workflow.${IJ_SUFFIX}
export IJ_UFS_TAG=9193010aa52f17a7b3618fd75b4e3c03a79c3c59
export SLURM_ACCOUNT=epic

cd /scratch3/NCEPDEV/stmp/Benjamin.Koziol/sandbox/NOAA-EPIC/jedi-ufs-scripting/in-line
source ./ij-do-all.sh
