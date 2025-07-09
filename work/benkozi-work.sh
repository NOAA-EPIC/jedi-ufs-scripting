#!/usr/bin/env bash

set -xue

export JU_CLONE_DIR=/scratch3/NCEPDEV/stmp/Benjamin.Koziol/sandbox/NOAA-EPIC/test/nest/me
export SLURM_ACCOUNT=epic

cd /scratch3/NCEPDEV/stmp/Benjamin.Koziol/sandbox/NOAA-EPIC/jedi-ufs-scripting
bash ./ju-build-and-test.sh
