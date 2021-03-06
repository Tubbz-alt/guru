# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit linux-mod

COMMIT="ca0bcba405f8865e6acd6a6d3cacf93f7e1b8a2c"

DESCRIPTION="Realtek 8821CU/RTL8811CU module for Linux kernel"
HOMEPAGE="https://github.com/brektrou/rtl8821CU"
SRC_URI="https://github.com/brektrou/rtl8821CU/archive/${COMMIT}.tar.gz -> rtl8821cu-${PV}.tar.gz"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"

DEPEND="virtual/linux-sources"

S="${WORKDIR}/rtl8821CU-${COMMIT}"

MODULE_NAMES="8821cu(net/wireless)"
BUILD_TARGETS="all"
