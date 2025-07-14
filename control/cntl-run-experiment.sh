#!/bin/bash


set -xue -o pipefail

export ACCOUNT=epic
export HOMEDIR=$(readlink -f ~)
export STMP=
export PTMP=/scratch3/NCEPDEV/stmp/Benjamin.Koziol/inline-jedi-ufs/control/forecast.20250714-1323

_GW_ROOT=/scratch3/NCEPDEV/stmp/Benjamin.Koziol/inline-jedi-ufs/control/global-workflow.20250711-1056
_NET=gfs
_MODE=forecast-only

source ${_GW_ROOT}/dev/ush/gw_setup.sh
cd ${_GW_ROOT}/dev/workflow
./setup_expt.py ${_NET} ${_MODE} \
  --idate