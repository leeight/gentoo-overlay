# Copyright 1999-2009 Tiziano Müller
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit git mono

DESCRIPTION="a branch of the official gtk#/gio to get gio# building on gtk# 2.12"
HOMEPAGE="http://gitorious.org/gio-sharp"
EGIT_REPO_URI="git://gitorious.org/${PN}/mainline.git"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-lang/mono-2
	dev-dotnet/glib-sharp
	dev-dotnet/gtk-sharp-gapi
	>=dev-libs/glib-2.22:2"
DEPEND="${RDEPEND}
	dev-util/pkgconfig
	sys-devel/autoconf
	sys-devel/automake"

EGIT_BOOTSTRAP="autogen-2.22.sh"

src_prepare() {
	mkdir -p config m4
	git_src_prepare
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc AUTHORS ChangeLog NEWS README
}

