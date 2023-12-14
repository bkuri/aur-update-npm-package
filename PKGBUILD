# Maintainer: Bernardo Kuri <aur+aur-update-npm-package@bkuri.com>

arch=('any')
depends=('npm')
license=('MIT')
optdepends=('git')
pkgdesc="Automates updating npm-based AUR packages"
pkgname=aur-update-npm-package
pkgrel=1
pkgver=1.0.1
sha256sums=('2d4afba990b6b741afd2a1a4b4aeb758396ddc9d8407028890d23fd8ca94d274')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bkuri/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")

url="https://github.com/bkuri/${pkgname}"

package() {
    # Install the script
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    # Install systemd unit files
    install -Dm644 "${srcdir}/${pkgname}.timer" "${pkgdir}/usr/lib/systemd/user/${pkgname}.timer"
    install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"

    # Install configuration file
    install -Dm644 "${srcdir}/${pkgname}.conf" "${pkgdir}/usr/share/${pkgname}/${pkgname}.conf"
}

post_install() {
    echo "=============================================================="
    echo " NOTE: Remember to copy the configuration file to"
    echo " \$XDG_CONFIG_HOME (typically \$HOME/.config):"
    echo ""
    echo " $ cp /usr/share/${pkgname}/${pkgname}.conf \$XDG_CONFIG_HOME"
    echo ""
    echo " Also remember to modify it to add all paths that"
    echo " you would like to monitor (one per line)"
    echo ""
    echo " Finally, enable the systemd timer like so:"
    echo ""
    echo " $ systemctl --user enable --now ${pkgname}.timer"
    echo "=============================================================="
}
