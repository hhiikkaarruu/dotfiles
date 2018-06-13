#!/bin/zsh

DOTPATH="${HOME}/.dotfiles"

cd ${DOTPATH}
if [ $? -ne 0 ]; then
	echo "not found:${DOTPATH}"
fi

for f in .??*
do
	[ "${f}" = ".git" ] && continue

	ln -snfv "${DOTPATH}/${f}" "${HOME}/${f}"
done

ln -snfv "${DOTPATH}/.vimrc" "${DOTPATH}/.vim/init.vim"
