# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit subversion eutils autotools

EAPI=3

DESCRIPTION="a project whose name came from the Romance_of_the_West_Chamber"
HOMEPAGE="http://code.google.com/p/scholarzhang/"
ESVN_REPO_URI="http://scholarzhang.googlecode.com/svn/trunk/"
ESVN_PROJECT="west-chamber-svn"

LICENSE="GPLv2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
RESTRICT="userpriv"

DEPEND="net-firewall/iptables"
RDEPEND="${DEPEND}"

subversion_src_unpack(){
	svn co ${ESVN_REPO_URI} ${S}
}

src_configure() {
	cd ${S}
	./autogen.sh --prefix=/usr  --libexecdir=/lib
	econf || die "econf failed"
}

src_compile() {
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}

pkg_postinst() {
	echo
	elog "It's beta version, if you find any probelm, please report"
	elog "an issue to http://code.google.com/p/scholarzhang/issues/entry"
	echo
}
