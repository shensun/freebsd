#!/bin/sh
# $FreeBSD: head/tools/regression/pjdfstest/tests/chflags/06.t 211352 2010-08-15 21:24:17Z pjd $

desc="chflags returns ELOOP if too many symbolic links were encountered in translating the pathname"

dir=`dirname $0`
. ${dir}/../misc.sh

require chflags

echo "1..6"

n0=`namegen`
n1=`namegen`

expect 0 symlink ${n0} ${n1}
expect 0 symlink ${n1} ${n0}
expect ELOOP chflags ${n0}/test SF_IMMUTABLE
expect ELOOP chflags ${n1}/test SF_IMMUTABLE
expect 0 unlink ${n0}
expect 0 unlink ${n1}
