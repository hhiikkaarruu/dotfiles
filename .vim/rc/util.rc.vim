" カーソル位置の行列をハイライト
set cursorcolumn
set cursorline
highlight clear CursorLine
" 永続的にUndoできるようにする(~/.vim/undoディレクトリ作成要)
if has('persistent_undo')
	set undodir=~/.vim/undo
	set undofile
endif
" grepをripgrepに変更
if executable('/usr/bin/rg')
	set grepprg=rg\ --vimgrep\ --no-heading\ $*
	set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
" vimdiff設定
au FilterWritePre * if &diff | set wrap | endif
hi DiffAdd		cterm=bold ctermfg=10 ctermbg=22
hi DiffDelete	cterm=bold ctermfg=10 ctermbg=52
hi DiffChange	cterm=bold ctermfg=10 ctermbg=17
hi DiffText		cterm=bold ctermfg=10 ctermbg=21
nnoremap <silent> dl :diffget 2<CR> :diffupdate<CR>
nnoremap <silent> do :diffget 3<CR> :diffupdate<CR>
nnoremap <silent> dp :diffput 1<CR> :diffupdate<CR>
function! s:vimdiff_in_newtab(...)
	if a:0 == 1
		tabedit %:p
		exec 'rightbelow vertical diffsplit ' . l:file
	else
		exec 'tabedit ' . a:1
		for l:file in a:000[1 :]
			exec 'rightbelow vertical diffsplit ' . l:file
		endfor
	endif
endfunction
command! -bar -nargs=+ -complete=file VimDiff call s:vimdiff_in_newtab(<f-args>)
filetype indent plugin on

" ウィンドウを移動したときにterminal-jobモードに
if has('nvim')
	autocmd WinEnter * if &buftype ==# 'terminal' | startinsert | endif
else
	autocmd WinEnter * if &buftype ==# 'terminal' | normal i | endif
endif

" Windows Subsystem for Linuxでヤンクでクリップボードにコピー 2020/01/15
if system('uname -a | grep Microsoft') != ''
	augroup myYank
		autocmd!
		autocmd TextYankPost * :call system('/mnt/c/Windows/System32/clip.exe', @")
	augroup END
endif
