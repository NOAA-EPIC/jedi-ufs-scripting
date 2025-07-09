#!/usr/bin/env bash

set -xue -o pipefail

export IJ_SUFFIX=20250709-1208
export IJ_CLONE_DIR=/scratch3/NCEPDEV/stmp/Benjamin.Koziol/sandbox/NOAA-EPIC/tmp/global-workflow.test.${IJ_SUFFIX}
export SLURM_ACCOUNT=epic

cd /scratch3/NCEPDEV/stmp/Benjamin.Koziol/sandbox/NOAA-EPIC/jedi-ufs-scripting/in-line

source ./ij-do-all.sh
