#!/bin/sh -e
#
# Copyright (c) 2016 Stephen L Arnold <nerdboy@gentoo.org>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

set -x
set -u
set -o pipefail

umask 022

exec < /dev/null

script_path=`cd $(dirname $0) && pwd -P`
. $script_path/build-common.sh

DIR=$ROOT
DISTRO=cross
SRC_URI=http://gentoo.osuosl.org/distfiles

if [ -d $HOME/download/ ] ; then
	dl_dir="$HOME/download"
else
	dl_dir="${DIR}/dl"
fi

datestamp=$TARGET-$RELEASEDATE
src_dir="${DIR}/src"

dl_generic () {
	WGET="wget -c --directory-prefix=${dl_dir}/"
	if [ ! -f "${src_dir}/${datestamp}" ] ; then

		echo "Installing: ${src_pack_name}"
		echo "-----------------------------"
		${WGET} "${SRC_URI}/${src_pack_name}"

		if [ -d "${src_dir}/${directory}" ] ; then
			rm -rf "${src_dir}/${directory}" || true
		fi

		tar -xf "${dl_dir}/${src_pack_name}" -C "${src_dir}/"

		touch "${src_dir}/${datestamp}"
	fi
}

src_names() {
	# setup names of source tarballs and directories
	BINUTILS_PACK=$BINUTILS-$BINUTILS_VER.tar.bz2
	BINUTILS_PATCH_PACK=$BINUTILS-$BINUTILS_VER-patches-$PATCH_VER.tar.xz
	BINUTILS_DIR=$BINUTILS-$BINUTILS_VER
	NEWLIB_PACK=$NEWLIB-$NEWLIB_VER.tar.gz
	NEWLIB_DIR=$NEWLIB-$NEWLIB_VER
	GCC_PACK=$GCC-$GCC_VER.tar.bz2
	GCC_PATCH_PACK=$GCC-$GCC_VER-patches-$PATCH_VER.tar.bz2
	PIE_PATCH_PACK=$GCC-$GCC_VER-piepatches-v$PIE_VER.tar.bz2
	GCC_DIR=$GCC-$GCC_VER
}

unpack_srcs() {

}

apply_patches() {

}

echo "---------------------------------"
echo "Downloading sources to ${DIR}/dl"
echo "---------------------------------"

download stuff...

echo "--------------------------------"
echo "Unpacking sources to ${DIR}/src"
echo "--------------------------------"

unpack stuff...

echo "---------"
echo "Done..."
echo "---------"

