# ebuild for b2-init-scripts (misc init for Excito B2)
# Copyright (c) 2015 sakaki <sakaki@deciban.com>
# License: GPL v2
# NO WARRANTY

EAPI=5

KEYWORDS="~ppc"

DESCRIPTION="Misc init scripts for the Excito B2 miniserver"
HOMEPAGE="https://github.com/sakaki-/gentoo-on-b2"
SRC_URI=""
LICENSE="GPL-3+"
SLOT="0"
IUSE=""

# required by Portage, as we have no SRC_URI...
S="${WORKDIR}"

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	newinitd "${FILESDIR}/bootled-initd-${PV}" "bootled"
	newinitd "${FILESDIR}/copynetsetup-initd-${PV}" "copynetsetup"
}

pkg_postinst() {
	elog "You should run:"
	elog " rc-update add bootled default"
	elog " rc-update add copynetsetup default"
	elog "to have these scripts run at boot time"
}
