#!/usr/bin/env bash

if [[ ! -v IJ_CLONE_DIR ]]; then
  echo "Please set IJ_CLONE_DIR, the target directory for the git clone of global-workflow"
  exit 1
fi

export JU_SUFFIX=${JU_SUFFIX:-$(date '+%Y%m%d-%H%M%S')}

_IJ_GDAS_DIR=${IJ_CLONE_DIR}/sorc/gdas.cd
_IJ_UFS_TAG=1f0ab4322b0c81e48a0db5a202a427d374e29be0
