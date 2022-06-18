EAPI=8

PYTHON_COMPAT=( python3_{9,10} )

inherit desktop distutils-r1

DESCRIPTION="GTK3-based wrapper to display script output in a wlroots layer shell."
HOMEPAGE="https://github.com/nwg-piotr/nwg-wrapper/"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/nwg-piotr/nwg-wrapper.git"
else
	SRC_URI="https://github.com/nwg-piotr/nwg-wrapper/archive/refs/tags/v${PV}.tar.gz -> ${P}-src.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="MIT"
SLOT="0"

IUSE="+wlr sway"

DEPEND="
	$(python_gen_cond_dep 'dev-python/pygobject[${PYTHON_USEDEP}]')
"
SWAY_DEPS=$(python_gen_cond_dep 'dev-python/i3ipc[${PYTHON_USEDEP}]')

RDEPEND="
	${DEPEND}
	sway? ( ${SWAY_DEPS} )
	gui-libs/gtk-layer-shell
	wlr? ( gui-apps/wlr-randr )
"

python_install() {
	distutils-r1_python_install
	# insinto /usr/share/pixmaps
	# doins nwg-panel.svg nwg-shell.svg
	# domenu nwg-panel-config.desktop
}
