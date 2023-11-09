#!/usr/bin/env zsh

function check_prog() {
    if ! hash "$1" > /dev/null 2>&1; then
        echo "command not found: $1. aborting..."
        exit 1
    fi
}
check_prog stow
mkdir -p "${HOME}/.config"

cd $(dirname $0)

PWD=$(pwd)
DOTDIRPATH=${HOME}/.dotfiles

mv ${PWD} ${DOTDIRPATH} &> /dev/null
cd ${DOTDIRPATH}
if [ $? -ne 0 ]; then
	echo "directory not found: ${DOTDIRPATH}. aborting..."
	exit 1
fi

for f in *
do
	[ ${f} = 'README.md' ] && continue
	[ ${f} = 'install.sh' ] && continue
	[ ${f} = 'uninstall.sh' ] && continue

	stow --target ${HOME} ${f}
done

echo 'dotfiles installation has been complated !'

