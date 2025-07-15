#!/usr/bin/env bash

if [[ ! -v IJ_CLONE_DIR ]]; then
  echo "ERROR: Please set IJ_CLONE_DIR, the target directory for the git clone of global-workflow"
  exit 1
fi
if [[ ! -v IJ_UFS_TAG ]]; then
  echo "WARNING: IJ_UFS_TAG=develop"
  export IJ_UFS_TAG=develop
fi

export IJ_SUFFIX=${IJ_SUFFIX:-$(date '+%Y%m%d-%H%M%S')}

_IJ_GDAS_DIR=${IJ_CLONE_DIR}/sorc/gdas.cd
