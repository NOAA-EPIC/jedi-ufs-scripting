#!/usr/bin/env bash


set -xue -o pipefail

export ACCOUNT=epic
_WD=/scratch3/NCEPDEV/stmp/Benjamin.Koziol/inline-jedi-ufs/control
export IJ_CLONE_DIR=${_WD}/global-workflow.20250711-1056

source ./util/ij-env.sh
source ./util/ij-load-modules.sh

# C's experiment configuration: /scratch2/BMC/gsienkf/cctong/exp_psonly_4mem/exp/exp_psonly_4mem

cd ${IJ_CLONE_DIR}/dev/workflow
./setup_expt.py gfs forecast-only \
  --app ATM \
  --idate 2022010312 \
  --edate 2022010400 \
  --resdetatmos 48 \
  --pslot test_control \
  --configdir ${IJ_CLONE_DIR}/dev/parm/config \
  --comroot ${_WD}/comroot \
  --expdir ${_WD}/exp
#  --resensatmos 96 \
#  --nens 4 \
#  --icsdir /work/noaa/da/telless/data/ICs/2022010312_v17_C192C96_output_new/
