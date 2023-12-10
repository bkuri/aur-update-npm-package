# Maintainer: Bernardo Kuri <aur+aur-update-npm-package@bkuri.com>

arch=('any')
depends=('npm')
license=('MIT')
optdepends=('git')
pkgdesc="Automates updating npm-based AUR packages"
pkgname=aur-update-npm-package
pkgrel=1
pkgver=1.0
sha256sums=('SKIP')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bkuri/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
url="https://github.com/bkuri/${pkgname}"

package() {
    # Install the script
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    # Install systemd unit files
    install -Dm644 "${srcdir}/${pkgname}.timer" "${pkgdir}/usr/lib/systemd/user/${pkgname}.timer"
    install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"

    # Install configuration file
    install -Dm644 "${srcdir}/${pkgname}.conf" "${pkgdir}${XDG_CONFIG_HOME}/${pkgname}.conf"
}
