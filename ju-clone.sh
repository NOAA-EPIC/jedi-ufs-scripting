#!/bin/bash

#!/bin/bash

set -xue

source ./util/ju-env.sh

git clone -b feature/JEDI-inline --recursive --jobs 8 https://github.com/NOAA-EPIC/global-workflow "${JU_CLONE_DIR}"

# Set the appropriate WM hash to work with spack-stack 1.6.0 -----

sed -i "s/\(set(UFS_TAG[^(]*\)\"develop\"/\1\"${_JU_UFS_TAG}\"/" "${_JU_GDAS_DIR}"/bundle/CMakeLists.txt

# Add the physics suite needed for the in-line experiment -----

sed -i 's/\(-DCCPP_SUITES=\)/\1FV3_GFS_v17_p8_ugwpv1,/' "${_JU_GDAS_DIR}"/bundle/CMakeLists.txt
