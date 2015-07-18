# ebuild for buildkernel-b2 (an Excito B2 kernel buildscript)
# Copyright (c) 2015 sakaki <sakaki@deciban.com>
# License: GPL v2
# NO WARRANTY

EAPI=5

inherit eutils

DESCRIPTION="Script to build a bootable Linux kernel for the Excito B2"
BASE_SERVER_URI="https://github.com/sakaki-"
HOMEPAGE="${BASE_SERVER_URI}/${PN}"
SRC_URI="${BASE_SERVER_URI}/${PN}/releases/download/${PV}/${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~ppc"

RESTRICT="mirror"

DEPEND=">=app-shells/bash-4.2"
# we choose not to make gentoo-b2-sources a hard dependency
RDEPEND="${DEPEND}
	>=sys-libs/ncurses-5.9-r2
	>=dev-embedded/u-boot-tools-2014.01"

# ebuild function overrides
src_install() {
	dosbin "${PN}"
	doman "${PN}.8"
}
