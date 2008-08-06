#!/usr/local/bin/zsh
# -*- shell-script -*-

testAlias()
{
    add_alias q quit
    expand_alias q
    assertEquals 'quit' $expanded_alias
    remove_alias q
    expand_alias q
    assertEquals 'q' $expanded_alias
}

# Make sure ../.. has a trailing slash
if [ '../..' = '' ] ; then
  echo "Something is wrong top_builddir is not set."
 exit 1
fi
top_builddir=../..
top_builddir=${top_builddir%%/}/

. $top_builddir/lib/alias.inc
. $top_builddir/lib/help.inc
. $top_builddir/command/alias.cmd

# load shunit2
set -o shwordsplit
SHUNIT_PARENT=$0

suite() {
    suite_addTest 'testAlias'
}

srcdir=.
srcdir=${srcdir}/
. ${srcdir}/shunit2
