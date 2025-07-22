#!/usr/bin/env bash

set -xue -o pipefail

source ./util/env.sh

# Build the GW -----

#pushd "${GW_CLONE_DIR}"/sorc
## JEDI-UFS only supports the atmospheric component. The WM build used by the letkf executable is
## built by fv3-jedi, but it's good to keep it consistent in case the WM is run via the GW.
#./build_all.sh -a ATM all
#./link_workflow.sh
#popd

# Build all GDASApp executables (hack currently) -----

source ./util/load-modules.sh

cd "${_IJ_GDAS_DIR}"/build
export LIBRARY_PATH=$LIBRARY_PATH:${netcdf_c_ROOT}/lib # hack for some builds (i.e. ioda)
make -j 8 2>&1 | tee out.make-gdas.cd."${IJ_SUFFIX}"
