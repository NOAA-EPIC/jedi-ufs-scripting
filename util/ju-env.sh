#!/usr/bin/env bash

if [[ ! -v JU_CLONE_DIR ]]; then
  echo "Please set JU_CLONE_DIR, the target directory for the git clone of global-workflow"
fi

_JU_GDAS_DIR=${JU_CLONE_DIR}/sorc/gdas.cd
_JU_UFS_TAG=1f0ab4322b0c81e48a0db5a202a427d374e29be0
