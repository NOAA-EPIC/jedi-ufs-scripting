#!/bin/bash

set -xue

source ./util/ju-env.sh

# Build the GW -----

cd "${JU_CLONE_DIR}"/sorc
./build_all.sh all

# Build all GDASApp executables (hack currently) -----

source ./util/ju-load-modules.sh

cd "${_JU_GDAS_DIR}"/build
export LIBRARY_PATH=$LIBRARY_PATH:${netcdf_c_ROOT}/lib # hack for some builds (i.e. ioda)
make -j 8 2>&1 | tee out.make-gdas.cd."${JU_SUFFIX}"
