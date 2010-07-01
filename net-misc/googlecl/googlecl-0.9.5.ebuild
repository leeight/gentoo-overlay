# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
inherit distutils eutils


DESCRIPTION="GoogleCL brings Google services to the command line. "
HOMEPAGE="http://code.google.com/p/googlecl/"
SRC_URI="http://${PN}.googlecode.com/files/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-python/gdata-2.0.10"
RDEPEND="${DEPEND}"

RESTRICT_PYTHON_ABIS="3.*"

PYTHON_MODNAME="googlecl"

src_install() {
	distutils_src_install
}
