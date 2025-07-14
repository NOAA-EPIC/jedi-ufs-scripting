#!/bin/bash


set -xue -o pipefail

_SUFFIX=20250714-1506

cd /scratch3/NCEPDEV/stmp/Benjamin.Koziol/inline-jedi-ufs
mkdir control-jedi_enkf_only
cd control-jedi-enkf_only
git clone -b feature/jedi_enkf_only --jobs 8 https://github.com/TravisElless-NOAA/global-workflow.git global-workflow.${_SUFFIX}
