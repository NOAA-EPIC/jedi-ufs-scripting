#!/bin/bash


set -xue -o pipefail

export GW_CLONE_DIR=/scratch3/NCEPDEV/stmp/Benjamin.Koziol/inline-jedi-ufs/experiment/global-workflow.20250711-1056
_PYTHON=/scratch3/NCEPDEV/stmp/Benjamin.Koziol/sandbox/miniconda3/envs/benkozi-work/bin/python3.13
_EXPTDIR=/scratch3/NCEPDEV/stmp/Benjamin.Koziol/inline-jedi-ufs/experiment/exp/test_control

source ../util/env.sh
source ../util/load-modules.sh

pushd ${_EXPTDIR}
#rocotoboot -w test_control.xml -d test_control.db -t gdas_stage_ic -c 202201031200
#rocotoboot -w test_control.xml -d test_control.db -t enkfgdas_stage_ic -c 202201031200
#rocotoboot -w test_control.xml -d test_control.db -t gdas_fcst_seg0 -c 202201031200
#rocotoboot -w test_control.xml -d test_control.db -m enkfgdas_fcst -c 202201031200
rocotoboot -w test_control.xml -d test_control.db -m gdas_atmos_prod -c 202201031200
rocotoboot -w test_control.xml -d test_control.db -t enkfgdas_echgres -c 202201031200
popd

#pushd ..
#bash ./ij-experiment.sh
#popd

${_PYTHON} ./submit_global_wflow.py ${_EXPTDIR}
