#!/usr/bin/env bash

set -xue -o pipefail

_SUFFIX=20250714-1506
_WD=/scratch3/NCEPDEV/stmp/Benjamin.Koziol/inline-jedi-ufs/control-jedi_enkf_only
_CLONE_DIR=${_WD}/global-workflow.${_SUFFIX}
_UFS_HASH=9193010aa52f17a7b3618fd75b4e3c03a79c3c59

# Clone -----

mkdir -p ${_CLONE_DIR}
git clone -b feature/jedi_enkf_only --jobs 8 --recursive https://github.com/TravisElless-NOAA/global-workflow.git ${_CLONE_DIR}
cd ${_CLONE_DIR}
git apply ./patch/travis-elless.patch

cd ${_CLONE_DIR}/sorc/ufs_model.fd
git fetch origin develop
git checkout ${_UFS_HASH}
git submodule update --init --recursive --jobs 8

# Build -----

# Using build_all.sh from https://github.com/TravisElless-NOAA/global-workflow/blob/develop/sorc/build_all.sh
cd ${_CLONE_DIR}/sorc
echo "INFO: sorc build directory= $(readlink -f .)"
./build_all.sh -a ATM -gu 2>&1 | tee ${_WD}/out.build_all.sh.${_SUFFIX}
./link_workflow.sh | tee ${_WD}/out.link_workflow.sh.${_SUFFIX}
