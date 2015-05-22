# Excito B2 + Gentoo patchset sources
# Copyright (c) 2015 sakaki <sakaki@deciban.com>
# License: GPL v2
# NO WARRANTY

EAPI="5"
ETYPE="sources"
K_WANT_GENPATCHES="base extras experimental"
K_GENPATCHES_VER="6"
K_DEBLOB_AVAILABLE="1"
inherit kernel-2
detect_version
detect_arch

KEYWORDS="~ppc"

BASE_SERVER_URI="https://github.com/sakaki-"
GITHUB_PROJECT="gentoo-b2-overlay"
GITHUB_PATCHES="gentoo-b2-kernel-patches"
B2_HOMEPAGE_URI="${BASE_SERVER_URI}/${GITHUB_PROJECT}"
B2_PATCHES_TARBALL="${GITHUB_PATCHES}-${PV}.tar.gz"
B2_PATCHES_URI="${BASE_SERVER_URI}/${GITHUB_PATCHES}/releases/download/${PV}/${B2_PATCHES_TARBALL}"
UNIPATCH_LIST="${DISTDIR}/${B2_PATCHES_TARBALL}"
UNIPATCH_STRICTORDER="yes"

HOMEPAGE="http://dev.gentoo.org/~mpagano/genpatches ${B2_HOMEPAGE_URI}"
IUSE="deblob experimental"

DESCRIPTION="Full sources with the Gentoo and B2 patchsets for the ${KV_MAJOR}.${KV_MINOR} kernel tree"
SRC_URI="${KERNEL_URI} ${GENPATCHES_URI} ${ARCH_URI} ${B2_PATCHES_URI}"

K_EXTRAELOG="Please direct issues with this kernel (on the Excito B2)
to sakaki <sakaki@deciban.com>"