#!/bin/bash

set -xue

source ./util/ju-env.sh

# Clone the GW -----

git clone -b feature/JEDI-inline --recursive --jobs 8 https://github.com/NOAA-EPIC/global-workflow "${JU_CLONE_DIR}"

# Checkout the appropriate WM hash to work with spack-stack 1.6.0 -----

sed -i "s/\(set(UFS_TAG[^(]*\)\"develop\"/\1\"${_JU_UFS_TAG}\"/" "${_JU_GDAS_DIR}"/bundle/CMakeLists.txt

# Add the physics suite needed for the in-line experiment

sed -i 's/\(-DCCPP_SUITES=\)/\1FV3_GFS_v17_p8_ugwpv1,/' "${_JU_GDAS_DIR}"/bundle/CMakeLists.txt

# Build the GW -----

cd ${_REPO_DIR}/sorc
./build_all.sh all

# Build all GDASApp executables (hack currently) -----

source ./util/ju-load-modules.sh

cd "${_JU_GDAS_DIR}"/build
export LIBRARY_PATH=$LIBRARY_PATH:${netcdf_c_ROOT}/lib # hack for some builds (i.e. ioda)
make -j 8 2>&1 | tee out.make-gdas.cd
