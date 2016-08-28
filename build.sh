#!/bin/bash
#
# (c) 2016 biocoder developers
#
# This file is part of biocoder,
# released under Apache License Version 2.0 (http://www.apache.org/licenses/LICENCE).
#

environment=${1:-NOT_SPECIFIED}

cd $(dirname $0)
if [ ! -d $environment ]; then
    echo "[ERROR] environment not found: $environment"
    exit 1
fi

cd $environment
docker build -t east301/biocoder-$environment .
