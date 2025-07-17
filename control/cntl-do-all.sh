#!/usr/bin/env bash


set -xue -o pipefail

_CNTL_SUFFIX=20250717-1520.ff5476b
_CNTL_CLONE_DIR=/scratch3/NCEPDEV/stmp/Benjamin.Koziol/inline-jedi-ufs/control/global-workflow.${_CNTL_SUFFIX}
_WD=/scratch3/NCEPDEV/stmp/Benjamin.Koziol/sandbox/NOAA-EPIC/jedi-ufs-scripting/control
_CNTL_BRANCH=develop
_CNTL_HASH=ff5476b

#cd ${_WD}
#git clone -b ${_CNTL_BRANCH} --recursive --jobs 8 https://github.com/NOAA-EMC/global-workflow "${_CNTL_CLONE_DIR}" 2>&1 | tee out.clone.${_CNTL_SUFFIX}
cd ${_CNTL_CLONE_DIR}
git checkout ${_CNTL_HASH}
git submodule update --init --recursive --jobs 8

#cd "${_CNTL_CLONE_DIR}"
#readlink -f .
#ls -lht
#git apply ${_WD}/build_ufs.patch

#cd "${_CNTL_CLONE_DIR}"/sorc
#./build_all.sh -a ATM all 2>&1 | tee "${_WD}"/out.build."${_CNTL_SUFFIX}"
