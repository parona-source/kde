# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

KDE_HANDBOOK="optional"
if [[ ${PV} == *9999 ]]; then
	eclass="kde4-base"
else
	eclass="kde4-meta"
	KMNAME="kdesdk"
fi
inherit ${eclass}

DESCRIPTION="Kompare is a program to view the differences between files."
KEYWORDS=""
IUSE="debug"
