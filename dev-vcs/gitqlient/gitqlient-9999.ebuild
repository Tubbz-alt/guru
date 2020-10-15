# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 qmake-utils xdg

MY_PN="GitQlient"

DESCRIPTION="Multi-platform Git client written with Qt"
HOMEPAGE="https://github.com/francescmm/GitQlient"

EGIT_BRANCH="develop"
EGIT_SUBMODULES=( QLogger )
EGIT_REPO_URI="https://github.com/francescmm/${MY_PN}.git"
SRC_URI=""
KEYWORDS=""

LICENSE="LGPL-2.1"
SLOT="0"
IUSE=""

DEPEND="
	dev-qt/qtwidgets:5
	dev-qt/qtcore:5
	dev-qt/qtnetwork:5
	dev-qt/qtsvg:5
	dev-qt/qtgui:5
"

RDEPEND="
	${DEPEND}
	dev-vcs/git
"

src_prepare() {
	default
	sed -i -e "s:Office:Development:" "${S}/src/resources/${PN}.desktop"
}

src_configure() {
	eqmake5 PREFIX=/usr "${MY_PN}".pro
}

src_install() {
	emake INSTALL_ROOT="${D}" install
}