#!/bin/sh

install() {
	echo "Installing package..."
}

update() {
	echo "Updating package..."
}

usage() {
	echo "Run install.sh with one of the following arguments:
	- 'install': installs the package.
	- 'update': updates the package, assuming previous installation."
}

case "$1" in
	install)
		install
		;;
	update)
		update
		;;
	*)
		usage
		;;
esac
exit 0
