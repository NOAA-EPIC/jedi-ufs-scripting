#!/bin/bash


set -xue -o pipefail

_SUFFIX=20250714-1506
_WD=/scratch3/NCEPDEV/stmp/Benjamin.Koziol/inline-jedi-ufs/control-jedi_enkf_only
_CLONE_DIR=${_WD}/global-workflow.${_SUFFIX}

mkdir -p ${_CLONE_DIR}
git clone -b feature/jedi_enkf_only --jobs 8 --recursive https://github.com/TravisElless-NOAA/global-workflow.git global-workflow.${_SUFFIX}

#cd ${_CLONE_DIR}/sorc
#echo "INFO: sorc build directory= $(readlink -f .)"
#./build_all.sh -gu
#./link_workflow.sh
