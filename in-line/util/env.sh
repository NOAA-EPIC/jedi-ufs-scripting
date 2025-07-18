#!/usr/bin/env bash

if [[ ! -v GW_CLONE_DIR ]]; then
  echo "ERROR: Please set GW_CLONE_DIR, the target directory for the git clone of global-workflow"
  exit 1
fi
if [[ ! -v IJ_UFS_TAG ]]; then
  # Tag corresponding to the WM used by the letkf experiment.
  echo "WARNING: IJ_UFS_TAG=9193010aa52f17a7b3618fd75b4e3c03a79c3c59"
  export IJ_UFS_TAG=9193010aa52f17a7b3618fd75b4e3c03a79c3c59
fi

export IJ_SUFFIX=${IJ_SUFFIX:-$(date '+%Y%m%d-%H%M%S')}

_IJ_GDAS_DIR=${GW_CLONE_DIR}/sorc/gdas.cd
