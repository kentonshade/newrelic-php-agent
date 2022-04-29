#!/bin/bash

#
# Copyright 2020 New Relic Corporation. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
#

# GHA: variables added for local testing
# PHP_VER='7.1'
# ARCH='x64'
export PATH=/opt/nr/php/${PHP_VER}/bin:$PATH
echo php "${PHP_VER}"
echo arch "${ARCH}"
make -j $(nproc) clean
make release-daemon
make release-installer
make release-docs
make release-scripts
make -r -j $(nproc) release-"${PHP_VER}"-gha "OPTIMIZE=1" "ARCH=${ARCH}"
make release-versions
# PHPS="${PHP_VER}" make -r -j $(nproc) release "OPTIMIZE=1" "ARCH=${ARCH}"
