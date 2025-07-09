#!/usr/bin/env bash

set -xue

export JU_CLONE_DIR=/scratch3/NCEPDEV/stmp/Benjamin.Koziol/sandbox/NOAA-EPIC/tmp/global-workflow.test.20250709-1127
export SLURM_ACCOUNT=epic

cd /scratch3/NCEPDEV/stmp/Benjamin.Koziol/sandbox/NOAA-EPIC/jedi-ufs-scripting

bash ./ij-do-all.sh
