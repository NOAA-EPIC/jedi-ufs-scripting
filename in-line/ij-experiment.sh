#!/usr/bin/env bash


set -xue -o pipefail

export HPC_ACCOUNT=epic
_WD=/scratch3/NCEPDEV/stmp/Benjamin.Koziol/inline-jedi-ufs/experiment
export GW_CLONE_DIR=${_WD}/global-workflow.20250711-1056

source ../util/env.sh
source ../util/load-modules.sh

# C's experiment configuration: /scratch2/BMC/gsienkf/cctong/exp_psonly_4mem/exp/exp_psonly_4mem

cd ${GW_CLONE_DIR}/dev/workflow
./setup_expt.py gfs cycled \
  --app ATM \
  --idate 2022010312 \
  --edate 2022010400 \
  --resdetatmos 192 \
  --pslot test_control \
  --configdir ${GW_CLONE_DIR}/dev/parm/config/gfs \
  --comroot ${_WD}/comroot \
  --expdir ${_WD}/exp \
  --resensatmos 96 \
  --nens 4
#  --icsdir /scratch2/BMC/gsienkf/cctong/exp_psonly_4mem/RUN/RUNDIRS/exp_psonly_4mem
#  --icsdir /work/noaa/da/telless/data/ICs/2022010312_v17_C192C96_output_new/

./setup_xml.py ${_WD}/exp/test_control