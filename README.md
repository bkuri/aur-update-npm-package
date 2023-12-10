# aur-update-npm-package

`aur-update-npm-package` is a bash script that automates the process of updating Arch Linux User Repository (AUR) packages based on npm packages. It simplifies the steps involved in checking for updates, downloading new packages, updating PKGBUILD files, and pushing changes to the AUR.

## Features

- **Automated Updates**: Keep your AUR packages up-to-date with the latest npm package versions automatically.
- **Simple Usage**: Easy-to-use script that streamlines the update process for AUR packages.
- **GitHub Actions Friendly**: Suitable for integration with GitHub Actions for periodic updates.

## Requirements

- Arch Linux
- npm (Node Package Manager)
- Git

## Installation

Install the `aur-update-npm-package` from the Arch User Repository:

```bash
yay -S aur-update-npm-package
```

## Usage

Run the updater with the following command inside the source path:

```bash
cd /path/to/aur/package
aur-update-npm-package
```

## Optional parameters

Use the `--publish` switch if you would like to publish the updated package to the AUR:

```bash
aur-update-npm-package --publish
```

You can also use the `--config <path>` parameter to check/update multiple packages.

Make sure to change `<path>` to the valid path to a text file that specifies multiple paths to process (one per line). For example:

```bash
# /tmp/packages.txt:

/path/to/package1
/path/to/package2
/path/to/package3

update-aur-npm-package --config /tmp/packages.txt
```

## Systemd unit file

Enable the user timer in order to run the application automatically:

```bash
systemctl --user enable aur-update-npm-package.timer --now
```
The default frequency is once per week. You can of course change this frequency by editing the systemd unit file (using the `systemctl --user edit aur-update-npm-package.timer` command).

Do note that the systemd file assumes that a config file named `aur-update-npm-package.conf` be present inside `$XDG_CONFIG_HOME` with at least one valid path specified. The `--publish` switch is also enabled. You can also remove that switch by editing the systemd unit itself using `systemctl --user edit aur-update-npm-package.service`.

## Contributing

Contributions are welcome! Feel free to open issues or pull requests.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
