#!/usr/bin/env bash

module purge

# Used for final building of the GW
source "${_IJ_GDAS_DIR}"/ush/detect_machine.sh
source "${_IJ_GDAS_DIR}"/ush/module-setup.sh
module use "${_IJ_GDAS_DIR}"/modulefiles
module load GDAS/hera.intel

# Used for ctest data staging
module load awscli-v2

#module use -a /scratch2/NCEPDEV/nwprod/NCEPLIBS/modulefiles
#module load prod_util
