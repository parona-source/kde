# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

FRAMEWORKS_DOXYGEN="true"
inherit kde-frameworks

DESCRIPTION="Framework for managing threads using job and queue-based interfaces"
LICENSE="LGPL-2+"
KEYWORDS="~amd64"
IUSE=""

# bogus dependency should be fixed in next version
DEPEND="dev-qt/qttest:5"

src_prepare() {
	sed -e "/add_subdirectory(benchmarks)/s/^/#DONOTCOMPILE /" \
		-i CMakeLists.txt || die

	kde-frameworks_src_prepare
}
