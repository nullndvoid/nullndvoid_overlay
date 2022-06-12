# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
 
EAPI=8

inherit meson

DESCRIPTION="Patched version of Rofi with Wayland support."
HOMEPAGE="https://github.com/lbonn/rofi"
SRC_URI="https://github.com/lbonn/rofi/releases/download/${PV}%2Bwayland1/rofi-${PV}+wayland1.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
 
DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
        meson_src_configure
}

src_install() {
	emake DESTDIR="${D}" install
	dodoc FAQ NEWS README
}
