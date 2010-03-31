# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils autotools versionator

MY_PN="${PN/-/}"
MY_P="${MY_PN}-${PV}"
DESCRIPTION="An OSD lyric show supporting multiple media players and downloading."
HOMEPAGE="http://code.google.com/p/osd-lyrics/"
SRC_URI="http://osd-lyrics.googlecode.com/files/${MY_P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+mpd"

RDEPEND="
	dev-libs/dbus-glib
	gnome-base/libglade
	net-misc/curl
	x11-libs/gtk+
	mpd? ( media-libs/libmpd )"

DEPEND="${RDEPEND}"

S=${WORKDIR}/${MY_P}

src_prepare(){
	epatch "${FILESDIR}/osdlyrics-libtool-tag.patch"
}

src_configure() {
	local myconf

	use mpd || myconf="${myconf} --disable-mpd --disable-xmms2"

	econf ${myconf}
}

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
	dodoc AUTHORS ChangeLog NEWS* README*
}
