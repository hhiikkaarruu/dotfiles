#!/usr/bin/env zsh

GIT_DOTPATH="${HOME}/dotfiles"
DOTPATH="${HOME}/.dotfiles"

mv "${GIT_DOTPATH}" "${DOTPATH}" &> /dev/null
cd "${DOTPATH}"
if [ $? -ne 0 ]; then
	echo "not found:${DOTPATH}"
fi

for f in .??*
do
	[ "${f}" = ".git" ] && continue
	[ "${f}" = ".swp" ] && continue

	ln -snfv "${DOTPATH}/${f}" "${HOME}/${f}"
done

ln -snfv "${DOTPATH}/.vimrc" "${DOTPATH}/.vim/init.vim"
mkdir -p "${HOME}/.config"
ln -snfv "${DOTPATH}/.vim" "${HOME}/.config/nvim"

echo 'installation has been complated. ✔︎'
