#!/usr/bin/env zsh

cd $(dirname $0)

PWD=$(pwd)
DOTDIRPATH=${HOME}/.dotfiles

mv ${PWD} ${DOTDIRPATH} &> /dev/null
cd ${DOTDIRPATH}
if [ $? -ne 0 ]; then
	echo "not found: ${DOTDIRPATH}"
fi

for f in *
do
	[ ${f} = 'README.md' ] && continue
	[ ${f} = 'install.sh' ] && continue
	[ ${f} = 'uninstall.sh' ] && continue

	ln -snfv ${DOTDIRPATH}/${f} ${HOME}/.${f}
done

mkdir -p ${HOME}/.config
ln -snfv ${DOTDIRPATH}/vim ${HOME}/.config/nvim
 
echo 'dotfiles installation has been complated !'

