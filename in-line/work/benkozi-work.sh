#!/usr/bin/env bash

set -xue

export IJ_CLONE_DIR=/scratch3/NCEPDEV/stmp/Benjamin.Koziol/sandbox/NOAA-EPIC/tmp/global-workflow.test.20250709-1127
export SLURM_ACCOUNT=epic

cd /scratch3/NCEPDEV/stmp/Benjamin.Koziol/sandbox/NOAA-EPIC/jedi-ufs-scripting/in-line

source ./ij-do-all.sh
