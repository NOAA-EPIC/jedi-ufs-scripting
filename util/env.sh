#!/usr/bin/env bash

if [[ ! -v GW_CLONE_DIR ]]; then
  echo "ERROR: Please set GW_CLONE_DIR, the target directory for the git clone of global-workflow"
  exit 1
fi
if [[ ! -v IJ_UFS_TAG ]]; then
  echo "WARNING: IJ_UFS_TAG=develop"
  export IJ_UFS_TAG=develop
fi

export IJ_SUFFIX=${IJ_SUFFIX:-$(date '+%Y%m%d-%H%M%S')}

_IJ_GDAS_DIR=${GW_CLONE_DIR}/sorc/gdas.cd
