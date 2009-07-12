# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
 
inherit eutils
 
DESCRIPTION="Shutter - Screenshot Tool"
HOMEPAGE="https://launchpad.net/shutter"
SRC_URI="http://shutter-project.org/wp-content/uploads/releases/tars/${P}.tar.gz"
 
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
  dev-perl/Goo-Canvas
  media-gfx/imagemagick
  net-print/gtklp
  dev-perl/X11-Protocol
  dev-perl/WWW-Mechanize
  gnome-extra/gnome-web-photo
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
 
