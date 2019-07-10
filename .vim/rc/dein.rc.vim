if &compatible
	set nocompatible
endif

let s:dein_path = expand('~/.vim/dein')
let s:dein_repo_path = s:dein_path . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_path)
	execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_path
endif

execute 'set runtimepath^=' . s:dein_repo_path

let g:dein#enable_notification = 1

if dein#load_state(s:dein_path)
	call dein#begin(s:dein_path)
	call dein#load_toml('~/.vim/rc/dein.toml', {'lazy': 0})
	call dein#load_toml('~/.vim/rc/deinlazy.toml', {'lazy': 1})
	call dein#end()
	call dein#save_state()
endif

set background=dark
colorscheme hybrid

if dein#check_install()
	call dein#install()
endif
