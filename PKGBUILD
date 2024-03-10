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
	license.tar.gz
	wechat-beta_${pkgver}_amd64.deb::"https://cdn4.cnxclm.com/uploads/2024/03/05/3VDyAc0x_wechat-beta_1.0.0.145_amd64.deb?attname=wechat-beta_${pkgver}_amd64.deb"
)

noextract=(
	wechat-beta_${pkgver}_amd64.deb
)

md5sums=('b72d3baff9d2d11b7df9c6589f433712'
         '5c1e5c7127fb3f6e5a25d098c885aabc'
         'ea5b20940f9aea7578867d86b4ae197d'
         '8bed07efd7e08768b66f1fca6fa7cce3'
         '1da072bd774d1b5c08b9545b409e3fcb')
build() {
	echo "Extract license file"
	tar -zxf ${srcdir}/license.tar.gz
	echo "Extract wechat-beta deb file"
	mkdir -p ${srcdir}/wechat-beta
	bsdtar -xpf wechat-beta_${pkgver}_amd64.deb -C ${srcdir}/wechat-beta
}

package() {
	echo "Extract wechat-beta deb file"
	bsdtar -xpf ${srcdir}/wechat-beta/data.tar.xz -C ${pkgdir}
	echo "Fixing licenses"
	mkdir -p ${pkgdir}/usr/share/wechat-kylin
	cp ${srcdir}/license/etc/.kyact ${pkgdir}/usr/share/wechat-kylin/.kyact
	cp ${srcdir}/license/etc/LICENSE ${pkgdir}/usr/share/wechat-kylin/LICENSE
	cp ${srcdir}/license/etc/lsb-release ${pkgdir}/usr/share/wechat-kylin/lsb-release
	install -Dm644 ${srcdir}/license/lib/libactivation.so ${pkgdir}/usr/lib/libactivation.so
	echo "Clean unused file"
	rm -f "${pkgdir}/usr/share/applications/wechat.desktop"
	echo "Installing stuff in place"
	install -Dm644 wechat-beta.desktop "${pkgdir}/usr/share/applications/wechat-beta.desktop"
	install -Dm755 wechat.sh "${pkgdir}/usr/bin/wechat-beta"
	install -Dm644 wechat-beta.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/wechat-beta.png"
}
