# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

ECM_HANDBOOK="forceoptional"
ECM_TEST="forceoptional"
KFMIN=5.74.0
QTMIN=5.15.1
VIRTUALX_REQUIRED="test"
inherit ecm kde.org

DESCRIPTION="System log viewer by KDE"
HOMEPAGE="https://apps.kde.org/en/ksystemlog"

LICENSE="GPL-2" # TODO: CHECK
SLOT="5"
KEYWORDS=""
IUSE="kdesu systemd"

DEPEND="
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qtprintsupport-${QTMIN}:5
	>=dev-qt/qtwidgets-${QTMIN}:5
	>=kde-frameworks/karchive-${KFMIN}:5
	>=kde-frameworks/kcompletion-${KFMIN}:5
	>=kde-frameworks/kconfig-${KFMIN}:5
	>=kde-frameworks/kconfigwidgets-${KFMIN}:5
	>=kde-frameworks/kcoreaddons-${KFMIN}:5
	>=kde-frameworks/ki18n-${KFMIN}:5
	>=kde-frameworks/kio-${KFMIN}:5
	>=kde-frameworks/kitemviews-${KFMIN}:5
	>=kde-frameworks/kservice-${KFMIN}:5
	>=kde-frameworks/ktextwidgets-${KFMIN}:5
	>=kde-frameworks/kwidgetsaddons-${KFMIN}:5
	>=kde-frameworks/kxmlgui-${KFMIN}:5
	systemd? ( sys-apps/systemd )
"
RDEPEND="${DEPEND}"

src_prepare() {
	ecm_src_prepare
	if ! use kdesu; then
		sed -e "/^X-KDE-SubstituteUID/s:true:false:" \
			-i src/org.kde.ksystemlog.desktop || die
	fi
}

src_configure() {
	local mycmakeargs=(
		$(cmake_use_find_package systemd Journald)
	)
	ecm_src_configure
}

pkg_postinst() {
	ecm_pkg_postinst
	use kdesu || elog "Will show only user readable logs without USE=kdesu (only in X)."
	use kdesu && elog "Cannot be launched from application menu in Wayland with USE=kdesu."
}
