#!/bin/bash

#!/bin/bash

set -xue

source ./util/ij-env.sh

if [ -d "${IJ_CLONE_DIR}" ]; then
  echo "IJ_CLONE_DIR cannot exist! Please remove before cloning"
  exit 1
fi

git clone -b feature/JEDI-inline --recursive --jobs 8 https://github.com/NOAA-EPIC/global-workflow "${IJ_CLONE_DIR}"

# Set the appropriate WM hash to work with spack-stack 1.6.0 -----

sed -i "s/\(set(UFS_TAG[^(]*\)\"develop\"/\1\"${_IJ_UFS_TAG}\"/" "${_IJ_GDAS_DIR}"/bundle/CMakeLists.txt

# Add the physics suite needed for the in-line experiment -----

sed -i 's/\(-DCCPP_SUITES=\)/\1FV3_GFS_v17_p8_ugwpv1,/' "${_IJ_GDAS_DIR}"/bundle/CMakeLists.txt
