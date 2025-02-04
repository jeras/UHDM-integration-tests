#!/usr/bin/env bash

set -x
set -e

cd $(dirname "$0")/..

# Default is to run tests.
MODE=${MODE:-test}

case $MODE in
    surelog-uhdm)
	make -j $(nproc) surelog/regression
	;;

    test)
	make -j $(nproc) ENABLE_READLINE=0 PRETTY=0 PARSER=$PARSER TEST=$TEST_CASE $TARGET
	;;

    *)
	echo "script.sh: Unknown mode $MODE"
	exit 1
	;;
esac
