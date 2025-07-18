#!/usr/bin/env bash

set -xue -o pipefail

tree -R > .tree.out &&  sed -i 's/\xC2\xA0/ /g' .tree.out
