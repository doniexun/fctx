#!/bin/sh
#
# Taken from Linus Torvald's Linux release script. See
# http://www.kernel.org/pub/software/scm/git-core/docs/user-manual.html.
#
# Examples would be:
#
#       release-script 1.2.0 1.2.0 1.2.1
#       release-script 2.6.12 2.6.13-rc6 2.6.13-rc7
# 
stable="$1"
last="$2"
new="$3"
pp="$4"
sign="gpg --passphrase $pp --armour --sign --detach-sign"

echo "git tag -s -m \"FCTX v$new\" v$new"
echo "git archive --prefix=fctx-$new/ v$new | gzip -9 > fctx-src-$new.tar.gz"
echo "git diff v$stable v$new | gzip -9 > patch-$new.gz"
echo "git log --no-merges v$new v$last > ChangeLog-$new"
echo "git shortlog --no-merges v$new v$last > ShortLog"
echo "git diff --stat --summary -M v$last v$new > diffstat-$new"

echo "pushd usr/doc"
echo "make clean html html_web"
echo "tar --create --verbose --transform='s,build/html,fct-doc-$new' build/html | gzip ../fctx-doc-$new.tar.gz"
echo "popd"

echo "cp include/fct.h fct.h"


echo "$sign fctx-src-$new.tar.gz"
echo "$sign fctx-doc-$new.tar.gz"
echo "$sign fct.h"
