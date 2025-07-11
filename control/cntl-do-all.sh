#!/usr/bin/env bash


set -xue -o pipefail

_CNTL_SUFFIX=20250711-1056
_CNTL_CLONE_DIR=/scratch3/NCEPDEV/stmp/Benjamin.Koziol/inline-jedi-ufs/control/global-workflow.${_CNTL_SUFFIX}
_WD=/scratch3/NCEPDEV/stmp/Benjamin.Koziol/sandbox/NOAA-EPIC/jedi-ufs-scripting/control

cd ${_WD}

git clone -b develop --recursive --jobs 8 https://github.com/NOAA-EPIC/global-workflow "${_CNTL_CLONE_DIR}" 2>&1 | tee out.clone.${_CNTL_SUFFIX}

#cd "${_CNTL_CLONE_DIR}"/sorc
#./build_all.sh all