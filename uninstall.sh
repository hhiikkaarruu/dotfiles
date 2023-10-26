#!/usr/bin/env zsh

cd $(dirname $0)

for f in *
do
	[ ${f} = 'README.md' ] && continue
	[ ${f} = 'install.sh' ] && continue
	[ ${f} = 'uninstall.sh' ] && continue

	dotfilepath="${HOME}/.${f}"

	[ ! -L ${dotfilepath} ] && continue

	unlink ${dotfilepath}
done

nvimdirpath=${HOME}/.config/nvim
[ -L ${nvimdirpath} ] && unlink ${nvimdirpath}

