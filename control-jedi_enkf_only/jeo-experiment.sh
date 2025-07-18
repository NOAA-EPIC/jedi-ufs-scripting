#!/usr/bin/env bash

# NOTE! - THIS IS A WORK-IN-PROGRESS.

set -xue -o pipefail

export HPC_ACCOUNT=epic
_WD=/scratch3/NCEPDEV/stmp/Benjamin.Koziol/inline-jedi-ufs/control-jedi_enkf_only
export HOMEgfs=${_WD}/global-workflow.20250714-1506

cd ${HOMEgfs}
source ./versions/run.hera.ver
source ./ush/detect_machine.sh
source ./ush/module-setup.sh
module use modulefiles
module load module_base.hera

# C's experiment configuration: /scratch2/BMC/gsienkf/cctong/exp_psonly_4mem/exp/exp_psonly_4mem

cd ${HOMEgfs}/workflow
./setup_expt.py gfs cycled \
  --app ATM \
  --idate 2022010312 \
  --edate 2022010400 \
  --resdetatmos 192 \
  --pslot test_control \
  --configdir ${HOMEgfs}/parm/config/gfs \
  --comroot ${_WD}/comroot \
  --expdir ${_WD}/exp \
  --resensatmos 96 \
  --nens 4 \
  --icsdir /scratch2/BMC/gsienkf/cctong/ICs/2022010312_v17_C192C96_output_new/
#  --icsdir /work/noaa/da/telless/data/ICs/2022010312_v17_C192C96_output_new/

./setup_xml.py ${_WD}/exp/test_control
