# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7,8,9} )

DOCS_BUILDER="mkdocs"
DOCS_DEPEND="
	dev-python/mkdocs_pymdownx_material_extras
	dev-python/mkdocs-minify-plugin
	dev-python/mkdocs-git-revision-date-localized-plugin
	dev-python/mkdocs-material
	dev-python/pyspelling
"

inherit distutils-r1 docs

DESCRIPTION="Wrapper around re or regex that adds additional back references"
HOMEPAGE="
	https://github.com/facelessuser/backrefs
	https://pypi.org/project/backrefs
"
SRC_URI="https://github.com/facelessuser/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

BDEPEND="test? ( dev-python/mock[${PYTHON_USEDEP}] )"

distutils_enable_tests pytest

src_compile() {
	# mkdocs-git-revision-date-localized-plugin needs git repo
	if use doc; then
		git init
		git config --global user.email "you@example.com" || die
		git config --global user.name "Your Name" || die
		git add .
		git commit -m 'init'
	fi

	distutils-r1_src_compile
}
