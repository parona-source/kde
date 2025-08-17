# Copyright 2023-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ECM_TEST="true"
KDE_ORG_CATEGORY="libraries"
KFMIN=6.3.0
inherit ecm kde.org

DESCRIPTION="Non-blocking Qt database framework"
HOMEPAGE="https://api.kde.org/futuresql/html/index.html https://invent.kde.org/libraries/futuresql"

if [[ ${KDE_BUILD_TYPE} = release ]]; then
	SRC_URI="mirror://kde/stable/${PN}/${P}.tar.xz"
	KEYWORDS="~amd64"
fi

LICENSE="MIT"
SLOT="0"
IUSE=""

RESTRICT="!test? ( test )"

RDEPEND="dev-qt/qtbase:6[sql]"
DEPEND="${RDEPEND}
	test? ( dev-libs/qcoro )
"
