# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ECM_TEST="true"
KFMIN="6.0"
QTMIN="6.0"
inherit ecm kde.org

DESCRIPTION="Header-only C++ library for parsing Markdown"
HOMEPAGE="https://invent.kde.org/libraries/md4qt"

LICENSE="BSD-2 CC-BY-4.0 CC-BY-SA-4.0 CC0-1.0 MIT"
SLOT="0"
KEYWORDS=""

IUSE="test"
RESTRICT="!test? ( test )"

DEPEND="
	test? (
		>=dev-qt/qtbase-${QTMIN}:6
		dev-libs/icu
		dev-libs/uriparser
	)
"

src_configure() {
	local mycmakeargs=(
		-DBUILD_MD4QT_BENCHMARK=OFF
		-DBUILD_MD4QT_QT_TESTS=$(usex test)
		-DBUILD_MD4QT_STL_TESTS=$(usex test)
		-DBUILD_MD2HTML_APP=OFF
		-DBUILD_TEST_BENCH=OFF
	)
	ecm_src_configure
}
