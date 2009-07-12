# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Chromium is the open-source project behind Google Chrome."
HOMEPAGE="http://code.google.com:80/chromium/"
SRC_URI="http://build.chromium.org/buildbot/snapshots/chromium-rel-linux/LATEST"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"

IUSE=""

DEPEND="
	>=dev-lang/python-2.4
	>=dev-libs/nss-3.12
	x11-libs/gtk+:2
	media-fonts/corefonts
"
RDEPEND="${DEPEND}"

S="${WORKDIR}/chromium"

pkg_preinst() {
	declare CHROMIUM_HOME=/opt/chromium.org/
	# Remove entire installed instance 
	rm -rf "${ROOT}"${CHROMIUM_HOME}
}


src_unpack() {
#get_latest_package 
	LV=`curl http://build.chromium.org/buildbot/snapshots/chromium-rel-linux/LATEST`	
	PACK="chrome-linux.zip"
	echo "LATEST PACKAGE: ${PACK}"
	PACK_URL="http://build.chromium.org/buildbot/snapshots/chromium-rel-linux/${LV}/${PACK}"
	wget ${PACK_URL} -O ${DISTDIR}/${PACK}
# unpack .deb and data.tar.gz
#	ar xv ${DISTDIR}/${PACK}
#	tar xvzf data.tar.gz
	unpack ${PACK}
}

src_compile() {
	# do nothing
	:
}


src_install() {
	declare CHROMIUM_HOME=/opt/chromium.org/

	dodir ${CHROMIUM_HOME}
	mv ${WORKDIR}/chrome-linux/ "${D}"${CHROMIUM_HOME}
	
	# Create symbol links for necessary libraries
	dosym /usr/lib/nspr/libnspr4.so ${CHROMIUM_HOME}/chrome-linux/libnspr4.so.0d
	dosym /usr/lib/nss/libnss3.so ${CHROMIUM_HOME}/chrome-linux/libnss3.so.1d
	dosym /usr/lib/nss/libnssutil3.so ${CHROMIUM_HOME}/chrome-linux/libnssutil3.so.1d
	dosym /usr/lib/nspr/libplc4.so ${CHROMIUM_HOME}/chrome-linux/libplc4.so.0d
	dosym /usr/lib/nspr/libplds4.so ${CHROMIUM_HOME}/chrome-linux/libplds4.so.0d
	dosym /usr/lib/nss/libsmime3.so ${CHROMIUM_HOME}/chrome-linux/libsmime3.so.1d
	dosym /usr/lib/nss/libssl3.so ${CHROMIUM_HOME}/chrome-linux/libssl3.so.1d

	# Create /usr/bin/chromium-bin
	dodir /usr/bin/
	cat <<EOF >"${D}"/usr/bin/chromium-bin
#!/bin/sh
unset LD_PRELOAD
export LD_LIBRARY_PATH=/opt/chromium.org/chrome-linux
exec /opt/chromium.org/chrome-linux/chrome "\$@"
EOF
	fperms 0755 "/usr/bin/chromium-bin"
	
}
