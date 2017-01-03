#!/bin/sh

RED='\033[0;31m'
NC='\033[m'

package_path="package_path"

install() {
	printf "Installing package...\n"
	printf "Specify an install location: [~] "
	read path
	if [ -z "$path" ]; then
		path=$HOME;
	fi

	if [ ! -d "$path" ]; then
		printf "Invalid install location. ${RED}ABORT${NC}\n"
		exit 1
	fi

	if [ -f "$path/.vimrc" ]; then
		printf "Package seems to already be installed in $path; do you want to overwrite ? [Y/n] "
		read yes
		yes=${yes:=y}
	else
		printf "Copying all files to $path\n"
		yes='y'
	fi

	case "$yes" in
		[yY][eE][sS]|[yY])
			;;
		*)
			printf "Not overwriting files. ${RED}ABORT${NC}\n"
			exit 0
			;;
	esac

	echo "$path" >> "$package_path"

	command cp -Riv .vim* $path/.
	
	printf "Finished installing package.\n"
}

check_package_path() {
	if [ -f "$package_path" ]; then
		printf "'$package_path' file missing. ${RED}ABORT${NC}\n"
		exit 2
	fi
}

check_package_installed() {
	if [ ! -f "$path/.vimrc" ]; then
		printf "Package install location $path seems to not contain files.\n"
		printf "'$package_path' file is either corrupted or falsy.\n"
		printf "use the 'install' command instead\n"
		exit 3
	fi
}

update() {
	printf "Updating package...\n"

	check_package_path

	path=`cat $package_path`

	check_package_installed

	command cp -Riv .vim* $path/.

	printf "Finished updating package.\n"
}

remove() {
	printf "Deleting package...\n"

	check_package_path

	path=`cat $package_path`

	check_package_installed

	printf "Delete package in '$path' ? [Y/n] "
	read yes
	yes=${yes:=y}
	
	case "$yes" in
		[yY][eE][sS]|[yY])
			;;
		*)
			printf "Not deleting files. ${RED}ABORT${NC}\n"
			exit 0
			;;
	esac

	rm -rv $path/.vim*

	printf "Deleted package.\n"
}

usage() {
	printf "Run install.sh with one of the following arguments:
	- 'install': installs the package.
	- 'update': updates the package, reading location from '$package_path' file.
	- 'remove': deletes the packages, reading location from '$package_path' file.\n"
}

case "$1" in
	install)
		install
		;;
	update)
		update
		;;
	remove)
		remove
		;;
	*)
		usage
		;;
esac
exit 0
