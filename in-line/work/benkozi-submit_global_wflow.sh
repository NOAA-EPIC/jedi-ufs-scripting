#!/bin/bash


set -xue -o pipefail

export GW_CLONE_DIR=/scratch3/NCEPDEV/stmp/Benjamin.Koziol/inline-jedi-ufs/experiment/global-workflow.20250711-1056
_PYTHON=/scratch3/NCEPDEV/stmp/Benjamin.Koziol/sandbox/miniconda3/envs/benkozi-work/bin/python3.13
_EXPTDIR=/scratch3/NCEPDEV/stmp/Benjamin.Koziol/inline-jedi-ufs/experiment/exp/test_control

source ../../util/env.sh
source ../../util/load-modules.sh

${_PYTHON} ../../util/submit_global_wflow.py ${_EXPTDIR}
