# Excito B2 + Gentoo patchset sources
# Copyright (c) 2015 sakaki <sakaki@deciban.com>
# License: GPL v2
# NO WARRANTY

EAPI="5"
ETYPE="sources"
K_WANT_GENPATCHES="base extras experimental"
K_GENPATCHES_VER="18"

inherit kernel-2
detect_version
detect_arch

KEYWORDS="~ppc"

BASE_SERVER_URI="https://github.com/sakaki-"
GITHUB_PROJECT="gentoo-b2-overlay"
GITHUB_PATCHES="gentoo-b2-kernel-patches"
B2_HOMEPAGE_URI="${BASE_SERVER_URI}/${GITHUB_PROJECT}"
PATCH_PVR="4.9.16"
B2_PATCHES_TARBALL="${GITHUB_PATCHES}-${PATCH_PVR}.tar.gz"
B2_PATCHES_URI="${BASE_SERVER_URI}/${GITHUB_PATCHES}/releases/download/${PATCH_PVR}/${B2_PATCHES_TARBALL}"
UNIPATCH_LIST="${DISTDIR}/${B2_PATCHES_TARBALL}"
UNIPATCH_STRICTORDER="yes"

HOMEPAGE="http://dev.gentoo.org/~mpagano/genpatches ${B2_HOMEPAGE_URI}"
IUSE="deblob experimental"

DESCRIPTION="Full sources with the Gentoo and B2 patchsets for the ${KV_MAJOR}.${KV_MINOR} kernel tree"
SRC_URI="${KERNEL_URI} ${GENPATCHES_URI} ${ARCH_URI} ${B2_PATCHES_URI}"

K_EXTRAELOG="Please direct issues with this kernel (on the Excito B2)
to sakaki <sakaki@deciban.com>"

pkg_postinst() {
	kernel-2_pkg_postinst
	einfo "For more info on this patchset, and how to report problems, see:"
	einfo "${HOMEPAGE}"
}

pkg_postrm() {
	kernel-2_pkg_postrm
}
