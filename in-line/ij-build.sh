#!/usr/bin/env bash

set -xue -o pipefail

source ../util/env.sh

# Build the GW -----

cd "${GW_CLONE_DIR}"/sorc
./build_all.sh all
./link_workflow.sh

# Build all GDASApp executables (hack currently) -----

source ../util/load-modules.sh

cd "${_IJ_GDAS_DIR}"/build
export LIBRARY_PATH=$LIBRARY_PATH:${netcdf_c_ROOT}/lib # hack for some builds (i.e. ioda)
make -j 8 2>&1 | tee out.make-gdas.cd."${IJ_SUFFIX}"
