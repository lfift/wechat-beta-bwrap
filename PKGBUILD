# Maintainer: leaeasy <leaeasy at gmail dot com>
#
pkgname=wechat-beta-bwrap
pkgver=1.0.0.145
pkgrel=11
uosver=2.1.1
epoch=
pkgdesc="WeChat Testing with bwrap sandbox"
arch=('x86_64')
url=""
license=('proprietary')
groups=()
depends=('nss' 'xdg-utils' 'libxss' 'libnotify' 'bubblewrap' 'xdg-desktop-portal' 'openssl-1.1' 'lsb-release')
source=(
	wechat.sh
	wechat-beta.desktop
	wechat-beta.png
	weixin_${uosver}_amd64.deb::"http://archive.ubuntukylin.com/software/pool/partner/weixin_2.1.1_amd64.deb"
	wechat-beta_${pkgver}_amd64.deb::"https://cdn4.cnxclm.com/uploads/2024/03/05/3VDyAc0x_wechat-beta_1.0.0.145_amd64.deb?attname=wechat-beta_${pkgver}_amd64.deb"
)

noextract=(
	weixin_${uosver}_amd64.deb
	wechat-beta_${pkgver}_amd64.deb
)

md5sums=('b72d3baff9d2d11b7df9c6589f433712'
         '5c1e5c7127fb3f6e5a25d098c885aabc'
         'ea5b20940f9aea7578867d86b4ae197d'
         'd6827fc8a0a86ac88a3fd0068700095e'
         '1da072bd774d1b5c08b9545b409e3fcb')
build() {
	echo "Extract weixin deb file"
	mkdir -p ${srcdir}/wechat-kylin
	dpkg -X ${srcdir}/weixin_${uosver}_amd64.deb ${srcdir}/wechat-kylin
	echo "Extract wechat-beta deb file"
	mkdir -p ${srcdir}/wechat-beta
	bsdtar -xpf wechat-beta_${pkgver}_amd64.deb -C ${srcdir}/wechat-beta
}

package() {
	echo "Extract wechat-beta deb file"
	bsdtar -xpf ${srcdir}/wechat-beta/data.tar.xz -C ${pkgdir}
	echo "Fixing licenses"
	mkdir -p ${pkgdir}/usr/share/wechat-kylin
	cp ${srcdir}/wechat-kylin/etc/.kyact ${pkgdir}/usr/share/wechat-kylin/.kyact
	cp ${srcdir}/wechat-kylin/etc/LICENSE ${pkgdir}/usr/share/wechat-kylin/LICENSE
	touch ${pkgdir}/usr/share/wechat-kylin/lsb-release
	echo "DISTRIB_ID=Kylin" >> ${pkgdir}/usr/share/wechat-kylin/lsb-release
	echo "DISTRIB_RELEASE=V10" >> ${pkgdir}/usr/share/wechat-kylin/lsb-release
	echo "DISTRIB_CODENAME=kylin" >> ${pkgdir}/usr/share/wechat-kylin/lsb-release
	echo "DISTRIB_DESCRIPTION=\"Kylin V10 SP1\"" >> ${pkgdir}/usr/share/wechat-kylin/lsb-release
	echo "DISTRIB_KYLIN_RELEASE=V10" >> ${pkgdir}/usr/share/wechat-kylin/lsb-release
	echo "DISTRIB_VERSION_TYPE=enterprise" >> ${pkgdir}/usr/share/wechat-kylin/lsb-release
	echo "DISTRIB_VERSION_MODE=normal" >> ${pkgdir}/usr/share/wechat-kylin/lsb-release
	install -Dm644 ${srcdir}/wechat-kylin/usr/lib/libactivation.so ${pkgdir}/usr/lib/libactivation.so
	echo "Clean unused file"
	rm -f "${pkgdir}/usr/share/applications/wechat.desktop"
	echo "Installing stuff in place"
	install -Dm644 wechat-beta.desktop "${pkgdir}/usr/share/applications/wechat-beta.desktop"
	install -Dm755 wechat.sh "${pkgdir}/usr/bin/wechat-beta"
	install -Dm644 wechat-beta.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/wechat-beta.png"
}
