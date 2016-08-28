#!/bin/bash
#
# (c) 2016 biocoder developers
#
# This file is part of biocoder,
# released under Apache License Version 2.0 (http://www.apache.org/licenses/LICENCE).
#

adduser --disabled-password --no-create-home --gecos '' biocoder

ulimit -m ${BIOCODER_MAX_MEMORY_KB:-102400}     # max memory size (kb)
ulimit -n ${BIOCODER_MAX_OPEN_FILES:-512}       # open files
ulimit -t ${BIOCODER_MAX_CPU_TIME:-5}           # cpu time
ulimit -u ${BIOCODER_MAX_USER_PROCESSES:-128}   # max user processes

/usr/bin/time --format="%U\n%M" --output=/biocoder/system/time.txt\
    sudo -u biocoder "$@"\
    1> /biocoder/system/stdout.txt\
    2> /biocoder/system/stderr.txt

echo $? > /biocoder/system/exit.txt
