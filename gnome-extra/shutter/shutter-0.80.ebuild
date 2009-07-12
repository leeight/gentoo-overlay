# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
 
inherit eutils
 
DESCRIPTION="Shutter - Screenshot Tool"
HOMEPAGE="https://launchpad.net/shutter"
SRC_URI="http://shutter-project.org/wp-content/uploads/releases/tars/${P/_p1/}.tar.gz"
 
LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
 
DEPEND="
  dev-perl/gtk2-perl
  dev-perl/gtk2-trayicon
  dev-perl/gnome2-perl
  dev-perl/gnome2-wnck
  dev-perl/gnome2-gconf
  media-gfx/imagemagick
  dev-perl/Gtk2-ImageView
  dev-perl/Goo-Canvas
  dev-perl/X11-Protocol
  dev-perl/WWW-Mechanize
"
RDEPEND="${DEPEND}"
 
S="${WORKDIR}/${P}"
 
src_unpack() {
  unpack ${A}
  cd $S
}
 
src_install() {
  dobin ${S}/bin/shutter
  cp -r ${S}/share ${D}/usr/share
}
 
