# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="1"

KMNAME=kdepim
inherit kde4-meta

DESCRIPTION="A newsreader for KDE"
KEYWORDS="~amd64"
IUSE="debug htmlhandbook"

DEPEND=">=kde-base/libkdepim-${PV}:${SLOT}
	>=kde-base/libkpgp-${PV}:${SLOT}"
RDEPEND="${DEPEND}"

KMEXTRACTONLY="libkdepim/
	libkpgp/"
	#kaddressbook/org.kde.KAddressbook.Core.xml
	#korganizer/korgac/org.kde.korganizer.KOrgac.xml"
KMLOADLIBS="libkdepim"
